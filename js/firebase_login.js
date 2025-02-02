// Import Firebase modules
import { initializeApp } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-app.js";
import { 
  getAuth, 
  signInWithEmailAndPassword, 
  setPersistence, 
  browserLocalPersistence, 
  onAuthStateChanged 
} from "https://www.gstatic.com/firebasejs/11.0.2/firebase-auth.js";

// Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyBncclJvMPg2JWZ6Xx_og8KWvGCki970V8",
  authDomain: "carbonari-1d14b.firebaseapp.com",
  projectId: "carbonari-1d14b",
  storageBucket: "carbonari-1d14b.appspot.com",
  messagingSenderId: "988846234895",
  appId: "1:988846234895:web:5ad714634aabcd1bdb327a"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const auth = getAuth();

// Show messages
function Showmsg(message, divID) {
  const messagediv = document.getElementById(divID);
  messagediv.style.display = "block";
  messagediv.innerHTML = message;
  messagediv.style.opacity = 1;
  setTimeout(() => {
    messagediv.style.opacity = "0";
    messagediv.style.display = "none";
  }, 5000);
}

// Handle sign-in logic
const signin = document.getElementById('SubmitLoginIn');
signin.addEventListener('click', async (event) => {
  event.preventDefault();

  const email = document.getElementById('Email').value;
  const password = document.getElementById('Password').value;

  try {
    // Set persistence
    await setPersistence(auth, browserLocalPersistence);

    // Sign in user
    const userCredential = await signInWithEmailAndPassword(auth, email, password);
    const user = userCredential.user;

    // Store user ID in local storage
    localStorage.setItem('LoggedUserID', user.uid);
    localStorage.setItem('LoggedUserEmail', user.email);
    localStorage.setItem('LoggedUsername', user.displayName || 'Guest');

    // Show success message
    Showmsg('Login Successful', 'signupmsg');

    // Redirect to another page
    window.location.href = '../pages/gamepage.html';
  } catch (error) {
    console.error("Sign-in error:", error);

    // Handle errors
    if (error.code === 'auth/wrong-password' || error.code === 'auth/user-not-found') {
      Showmsg('Incorrect Email or Password', 'signupmsg');
    } else if (error.code === 'auth/too-many-requests') {
      Showmsg('Too many failed attempts. Please try again later.', 'signupmsg');
    } else {
      Showmsg('An error occurred. Please try again.', 'signupmsg');
    }
  }
});

// Authentication state listener
onAuthStateChanged(auth, (user) => {
  if (user) {
    localStorage.setItem('LoggedUserID', user.uid);
    localStorage.setItem('LoggedUserEmail', user.email);
    localStorage.setItem('LoggedUsername', user.displayName || 'Guest');
    console.log("User is logged in:", user.uid);
  } else {
    localStorage.removeItem('LoggedUserID');
    localStorage.removeItem('LoggedUserEmail');
    localStorage.removeItem('LoggedUsername');x``
    console.log("No user is logged in");
  }
});