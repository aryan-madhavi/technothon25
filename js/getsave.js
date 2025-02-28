import { initializeApp } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-app.js";
import { getFirestore, doc, getDoc } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-firestore.js";

// Firebase Configuration
const firebaseConfig = {
    apiKey: "AIzaSyBncclJvMPg2JWZ6Xx_og8KWvGCki970V8",
    authDomain: "carbonari-1d14b.firebaseapp.com",
    projectId: "carbonari-1d14b",
    storageBucket: "carbonari-1d14b.firebasestorage.app",
    messagingSenderId: "988846234895",
    appId: "1:988846234895:web:5ad714634aabcd1bdb327a"
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
    const LoogedInUserId = localStorage.getItem("LoggedUserID");
    // const stats = {
    //     botdefeated : localStorage.getItem("botdefeated")
    // };    

    // console.log(LoogedInUserId)

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
            console.log("User document exists, Local Storage data...");
            console.log(docSnap.data());
            localStorage.setItem('UserSaveFile', JSON.stringify(docSnap.data()['save']));
            localStorage.setItem('Stats', JSON.stringify(docSnap.data()['stats']));
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