import { initializeApp } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-app.js";
import { getFirestore, doc, getDoc } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-firestore.js";

// Firebase Configuration
const firebaseConfig = {
    apiKey: "AIzaSyCuGCAAFiiMDrWeerT0eY-ZzcbpeemBa8M",
    authDomain: "carbonari-b1a91.firebaseapp.com",
    projectId: "carbonari-b1a91",
    storageBucket: "carbonari-b1a91.firebasestorage.app",
    messagingSenderId: "487055169038",
    appId: "1:487055169038:web:4114c67d398b5765d0ce5f",
    measurementId: "G-N3H2V77CN3"
  };

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const db = getFirestore(app);
// const temp = document.getElementById("temp");
// Function to sync local storage data with Firebase
async function getsave() {
    console.log(" Syncing local storage with Firebase...");

    // Retrieve user data from local storage
    // const LoggedInUser = JSON.parse(localStorage.getItem("UserSaveFile"));
    // const save = {
    //     completed: [ "challange1.json"],
    //     current_level : 5
    //   }
    const LoggedInUser = JSON.parse(localStorage.getItem("UserSaveFile"));
    const LoggedInUserId = localStorage.getItem("LoggedUserID");
    // const stats = {
    //     botdefeated : localStorage.getItem("botdefeated")
    // };    

    // console.log(LoogedInUserId)

    if (!LoggedInUser || !LoggedInUserId) {
        console.warn("No valid user data found in local storage.");
        return;
    }

    try {
        // Reference to Firestore document
        const userRef = doc(db, "user", LoggedInUserId);

        // Check if document exists in Firestore
        const docSnap = await getDoc(userRef);
        if (docSnap.exists()) {
            console.log("User document exists, Local Storage data...");
            // console.log(docSnap.data());
            localStorage.setItem('UserSaveFile', JSON.stringify(docSnap.data()['save']));
            localStorage.setItem('Stats', JSON.stringify(docSnap.data()['stats']));
            localStorage.setItem('TimePlayed', docSnap.data()['TimePlayed']);
            
            // console.log(temp.value)
            // await updateDoc(userRef, {save : LoggedInUser, botdefeated : stats.botdefeated});
            // localStorage.setItem("UserSaveFile", LoggedInUser);
            // await updateDoc(userRef,  { username: temp.value });
            console.log("Local Sync successful!");
        } else {
            console.warn("User document does not exist in Firestore, skipping update.");
        }
    } catch (error) {
        console.error(" Error syncing data:", error);
    }
}

export { getsave };