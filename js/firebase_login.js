// Import Firebase modules
import { initializeApp } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-app.js";
import { 
  getAuth, 
  signInWithEmailAndPassword, 
  setPersistence, 
  browserLocalPersistence, 
  onAuthStateChanged 
} from "https://www.gstatic.com/firebasejs/11.0.2/firebase-auth.js";
import { getFirestore, doc , getDoc} from "https://www.gstatic.com/firebasejs/11.0.2/firebase-firestore.js";

// For Firebase JS SDK v7.20.0 and later, measurementId is optional
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
const db = getFirestore(app);


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

    const docref = doc(db, "user", user.uid);
    const docSnap = await getDoc(docref);
    // console.log("Document data:", docSnap.data());

    // Store user ID in local storage
    localStorage.setItem('LoggedUserID', user.uid);
    localStorage.setItem('LoggedUserEmail', user.email);
    localStorage.setItem('LoggedUsername', user.displayName || 'Guest');
    localStorage.setItem('UserSaveFile', JSON.stringify(docSnap.data()['save']));
    localStorage.setItem('Stats', JSON.stringify(docSnap.data()['stats']));
    localStorage.setItem('TimePlayed', parseInt(docSnap.data()['TimePlayed']));

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
    // localStorage.setItem('LoggedUserID', user.uid);
    // localStorage.setItem('LoggedUserEmail', user.email);
    // localStorage.setItem('LoggedUsername', user.displayName || 'Guest');
    // console.log("User is logged in:", user.uid);
  } else {
    localStorage.removeItem('LoggedUserID');
    localStorage.removeItem('LoggedUserEmail');
    localStorage.removeItem('LoggedUsername');
    localStorage.removeItem('UserSaveFile');
    localStorage.removeItem('Stats');
    // localStorage.removeItem('botdefeated');
    console.log("No user is logged in");
  }
});
