import { initializeApp } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-app.js";
import { getAuth,  signOut } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-auth.js";

// Firebase configuration
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
const auth = getAuth();


function dologin(){
    //alert("Login clicked!");
    window.location.href = "pages/login.html";
}
function getstarted(){
    //alert("Login clicked!");
    window.location.href = "pages/login.html";
}

function dosignup() {
    //alert("Signup clicked!"); 
    window.location.href = "pages/signup.html";
}

function startgame(){
    window.location.href = "pages/gamepage.html";
}

function goindex(){
    window.location.href = "../index.html";
}

function gohome(){
    window.location.href = "index.html";
}

function gosameindex(){
    window.location.href = "index.html";
}

async function dologout(){
    try {
        await signOut(auth);
        alert('You have been logged out!');
        localStorage.removeItem('LoggedUserID');
        localStorage.removeItem('LoggedUserEmail');
        localStorage.removeItem('LoggedUsername');
        localStorage.removeItem('UserSaveFile');
        window.location.href = 'index.html';  
      } catch (error) {
        console.error('Error logging out:', error);
        alert('There was an error logging you out. Please try again.');
      }
}