import { initializeApp } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-app.js";
import { getAuth, onAuthStateChanged, setPersistence, browserLocalPersistence } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-auth.js";

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

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);  // Make sure to pass the app instance

// Get HTML elements
const loginBtn = document.getElementById("loginBtn");
const signupBtn = document.getElementById("signupBtn");
const logoutBtn = document.getElementById("logoutBtnIndex");
const home = document.getElementById("home");
const game = document.getElementById("game");
const aboutus = document.getElementById("aboutus");
const profile = document.getElementById("profile");
const getstarted = document.getElementById("getstarted");
const interpreter = document.getElementById("interpreter");


document.addEventListener("DOMContentLoaded", function () {
    // Set persistence to local storage
    setPersistence(auth, browserLocalPersistence)
        .then(() => {
            // Listen for authentication state changes
            onAuthStateChanged(auth, (user) => {
                if (user) {
                    // User is logged in
                    console.log(user.uid);  
                    loginBtn.style.display = "none";
                    signupBtn.style.display = "none";
                    getstarted.style.display = "none";
                    interpreter.style.display = "block";
                    logoutBtn.style.display = "block";
                    home.style.display = "block";
                    game.style.display = "block";
                    aboutus.style.display = "block";
                    profile.style.display = "block";

                } else {
                    // User is logged out
                    loginBtn.style.display = "block";
                    signupBtn.style.display = "block";
                    getstarted.style.display = "block";
                    interpreter.style.display = "none";
                    logoutBtn.style.display = "none";
                    home.style.display = "block";
                    game.style.display = "none";
                    aboutus.style.display = "none";
                    profile.style.display = "none";
                }
            });
        })
        .catch((error) => {
            console.error("Error setting persistence:", error);
        });
});
