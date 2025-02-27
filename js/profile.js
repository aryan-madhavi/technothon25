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
const auth = getAuth();

// Get HTML elements to display user data
const usernameElement = document.getElementById('username');
const emailElement = document.getElementById('email');
const logoutBtn = document.getElementById('logoutBtn');

// Set persistence to local to ensure session stays active even after a page reload
setPersistence(auth, browserLocalPersistence)
  .then(() => {
    // After setting persistence, use onAuthStateChanged to handle user state
    onAuthStateChanged(auth, (user) => {
      if (user) {
        // User is logged in
        // console.log('User UID:', user.uid);
        // console.log('User Email:', user.email);
        // console.log('User Display Name:', user.displayName);

        // Set the values in the HTML elements
        usernameElement.innerText = `UserName: ${user.displayName || 'Guest'}`;  // If no displayName, show 'Guest'
        emailElement.innerText = `Email: ${user.email}`;

      } else {
        // No user is logged in
        console.log('No user is logged in');
        usernameElement.innerText = "UserName: Guest";
        emailElement.innerText = "Email: Not logged in";
      }
    });
  })
  .catch((error) => {
    console.error("Error setting persistence:", error);
  });

// Implement logout functionality
logoutBtn.addEventListener('click', async () => {
  try {
    await signOut(auth);
    alert('You have been logged out!');
    localStorage.removeItem('LoggedUserID');
    localStorage.removeItem('LoggedUserEmail');
    localStorage.removeItem('LoggedUsername');
    localStorage.removeItem('UserSaveFile');
    window.location.href = '../index.html';  
  } catch (error) {
    console.error('Error logging out:', error);
    alert('There was an error logging you out. Please try again.');
  }
});
