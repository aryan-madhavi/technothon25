import { initializeApp } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-app.js";
import { getFirestore, doc, updateDoc, getDoc } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-firestore.js";

import { getsave } from "./getsave.js";
import {startprogress} from "./progress.js";
import { updateBadge, updatebotdefeated} from "./stats.js";

// Firebase Configuration
const firebaseConfig = {
    apiKey: "AIzaSyBncclJvMPg2JWZ6Xx_og8KWvGCki970V8",
    authDomain: "carbonari-1d14b.firebaseapp.com",
    projectId: "carbonari-1d14b",
    storageBucket: "carbonari-1d14b.firebasestorage.app",
    messagingSenderId: "988846234895",
    appId: "1:988846234895:web:5ad714634aabcd1bdb327a"
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
            timecounter += 3;
            console.log("Time Counter : ", timecounter)
            await updateDoc(userRef, {save : LoggedInUser});
            await updateDoc(userRef, {TimePlayed : timecounter});
            await updateDoc(userRef, {stats : local_stats});

            startprogress();
            localStorage.setItem('TimePlayed', timecounter)
            updateTimeElement(timecounter);
            let currentlvl = docSnap.data()['save'].current_level
            let lenofcurrentcompletedlevel = docSnap.data()['save']['completed'].length;
            // console.log("Length o Current Level: ", lenofcurrentcompletedlevel);
            updateBadge(currentlvl);
            updatebotdefeated(currentlvl, lenofcurrentcompletedlevel);
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
    syncLocalWithFirebase().then(() => {
        console.log("Next sync scheduled in 3 sec...");
        setTimeout(syncWithDelay, 3000); // Run again after 5 sec 
    }).catch(error => {
        console.error("Sync failed, retrying in 3 sec...", error);
        setTimeout(syncWithDelay, 3000);
    });
}

function updateTimeElement(time) {
    let given_seconds = time;

    let hours = Math.floor(given_seconds / 3600);
    let minutes = Math.floor((given_seconds - (hours * 3600)) / 60);
    let seconds = given_seconds - (hours * 3600) - (minutes * 60);

    let timeString = hours.toString().padStart(2, '0') + ':' + minutes.toString().padStart(2, '0');
        
    doctimeplayed.innerText = `TimePlayed : ${timeString}`;
}

getsave();
// console.log("SynsSave Running")
// Start the continuous sync
syncWithDelay();
// export { syncLocalWithFirebase };