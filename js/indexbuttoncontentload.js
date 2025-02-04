import { initializeApp } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-app.js";
import { getAuth, onAuthStateChanged, signOut, setPersistence, browserLocalPersistence } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-auth.js";

// Firebase configuration
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
const auth = getAuth(app);  // Make sure to pass the app instance

// Get HTML elements
const loginBtn = document.getElementById("loginBtn");
const signupBtn = document.getElementById("signupBtn");
const logoutBtn = document.getElementById("logoutBtn");
const home = document.getElementById("home");
const game = document.getElementById("game");
const aboutus = document.getElementById("aboutus");
const profile = document.getElementById("profile");


document.addEventListener("DOMContentLoaded", function () {
    // Set persistence to local storage
    setPersistence(auth, browserLocalPersistence)
        .then(() => {
            // Listen for authentication state changes
            onAuthStateChanged(auth, (user) => {
                if (user) {
                    // User is logged in
                    console.log(user.uid);  // Log the user's UID
                    loginBtn.style.display = "none";
                    signupBtn.style.display = "none";
                    logoutBtn.style.display = "block";
                    home.style.display = "block";
                    game.style.display = "block";
                    aboutus.style.display = "block";
                    profile.style.display = "block";

                } else {
                    // User is logged out
                    loginBtn.style.display = "block";
                    signupBtn.style.display = "block";
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
