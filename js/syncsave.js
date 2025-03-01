import { initializeApp } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-app.js";
import { getFirestore, doc, updateDoc, getDoc } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-firestore.js";

import { getsave } from "./getsave.js";
import {startprogress} from "./progress.js";
import { updateBadge, updatebotdefeated} from "./stats.js";

// Firebase Configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: "AIzaSyCuGCAAFiiMDrWeerT0eY-ZzcbpeemBa8M",
    authDomain: "carbonari-b1a91.firebaseapp.com",
    projectId: "carbonari-b1a91",
    storageBucket: "carbonari-b1a91.firebasestorage.app",
    messagingSenderId: "487055169038",
    appId: "1:487055169038:web:4114c67d398b5765d0ce5f",
    measurementId: "G-N3H2V77CN3"
  };

let timecounter = parseInt(localStorage.getItem('TimePlayed'));
const doctimeplayed = document.getElementById("PlayedTime");

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const db = getFirestore(app);
// const temp = document.getElementById("temp");
// Function to sync local storage data with Firebase
async function syncLocalWithFirebase() {
    console.log(" Syncing local storage with Firebase...");

    // Retrieve user data from local storage
    // const LoggedInUser = JSON.parse(localStorage.getItem("UserSaveFile"));
    // const save = {
    //     completed: [ "challange1.json"],
    //     current_level : 5
    //   }
    const LoggedInUser = JSON.parse(localStorage.getItem("UserSaveFile"));
    const LoogedInUserId = localStorage.getItem("LoggedUserID");
    const local_stats = JSON.parse(localStorage.getItem("Stats"));    

    console.log(LoogedInUserId)

    if (!LoggedInUser || !LoogedInUserId) {
        console.warn("No valid user data found in local storage.");
        return;
    }

    try {
        // Reference to Firestore document
        const userRef = doc(db, "user", LoogedInUserId);

        // Check if document exists in Firestore
        const docSnap = await getDoc(userRef);
        if (docSnap.exists()) {
            console.log("User document exists, updating data...");
            
            await updateDoc(userRef, {save : LoggedInUser});
            await updateDoc(userRef, {TimePlayed : timecounter});
            await updateDoc(userRef, {stats : local_stats});

            let currentlvl = docSnap.data()['save'].current_level
            let lenofcurrentcompletedlevel = docSnap.data()['save']['completed'].length;
            let totalbotdefeat = updatebotdefeated(currentlvl, lenofcurrentcompletedlevel);

            startprogress(totalbotdefeat,  lenofcurrentcompletedlevel);

            // console.log("Length o Current Level: ", lenofcurrentcompletedlevel);
            updateBadge(currentlvl);
            // localStorage.setItem("UserSaveFile", LoggedInUser);
            // await updateDoc(userRef,  { username: temp.value });
            console.log(" Sync successful!");
        } else {
            console.warn("User document does not exist in Firestore, skipping update.");
        }
    } catch (error) {
        console.error(" Error syncing data:", error);
    }
}

function syncWithDelay() {
    if (localStorage.getItem('SavingFile') == "true")
    syncLocalWithFirebase().then(() => {
        console.log("Next sync scheduled in 3 sec...");
    }).catch(error => {
        console.error("Sync failed, retrying in 3 sec...", error);
    });
    localStorage.setItem('SavingFile',"false");
    setTimeout(syncWithDelay, 3000); // Run again after 5 sec 
}

function timerWithDelay() {
    syncLocalWithFirebase();

    timecounter += 3;
    console.log("Time Counter : ", timecounter);

    localStorage.setItem('TimePlayed', timecounter)
    updateTimeElement(timecounter);
    
    setTimeout(timerWithDelay, 3000); // Run again after 5 sec 
}

function updateTimeElement(time) {
    let given_seconds = time;

    let hours = Math.floor(given_seconds / 3600);
    let minutes = Math.floor((given_seconds - (hours * 3600)) / 60);
    let seconds = given_seconds - (hours * 3600) - (minutes * 60);

    let timeString = hours.toString().padStart(2, '0') + ' Hours ' + minutes.toString().padStart(2, '0')  + ' Minutes ' ;
        
    doctimeplayed.innerText = `TimePlayed : ${timeString}`;
}

// Get SAVE file
getsave();

// Update total time played timer
timerWithDelay();

// Start the continuous sync
syncWithDelay();

// export { syncLocalWithFirebase };