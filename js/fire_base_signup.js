// Import Firebase modules
import { initializeApp } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-app.js";
import { 
  getAuth, 
  createUserWithEmailAndPassword, 
  updateProfile 
} from "https://www.gstatic.com/firebasejs/11.0.2/firebase-auth.js";
import { getFirestore, setDoc, doc } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-firestore.js";

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

const app = initializeApp(firebaseConfig);
const auth = getAuth();
const db = getFirestore();

// Show messages
function Showmsg(message, divID) {
  const messagediv = document.getElementById(divID);
  messagediv.style.display = "block";
  messagediv.innerHTML = message;
  messagediv.style.opacity = 1;

  setTimeout(() => {
    messagediv.style.opacity = "0";
    setTimeout(() => (messagediv.style.display = "none"), 500); 
  }, 5000);
}

const Signup = document.getElementById('SubmitSignUp');
Signup.addEventListener('click', (event) => {
  event.preventDefault();

  const username = document.getElementById('Username').value;
  const email = document.getElementById('email').value.trim();
  const password = document.getElementById('Password1').value;
  const confirmPassword = document.getElementById('Password2').value;
  const save = {
      completed: [],
      current_level : 0
  };
  const stats = {
    botdefeated : 0
  };
  const TimePlayed = 0;

  if (password !== confirmPassword) {
    Showmsg("Passwords do not match.", "signupmsg");
    return; // Prevent further action if passwords don't match
  }

  // Validate email format
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) {
    Showmsg("Please enter a valid email address.", "signupmsg");
    return;
  }

  // Validate password length
  if (password.length <= 6) {
    Showmsg("Password must be at least 6 characters long.", "signupmsg");
    return;
  }

  createUserWithEmailAndPassword(auth,  email, password)
    .then((userCredential) => {
      const user = userCredential.user;
      const userdata = { username, email, password, save, stats, TimePlayed};

      // Set the displayName for the new user
      return updateProfile(user, {
        displayName: username
      })
      .then(() => {
        // Store user data in Firestore
        const docref = doc(db, "user", user.uid);
        return setDoc(docref, userdata);
      });
    })
    .then(() => {
      // Show success message and redirect to login page
      alert("Account created successfully!");
      localStorage.removeItem('LoggedUserID');
      localStorage.removeItem('LoggedUserEmail');
      localStorage.removeItem('LoggedUsername');
      window.location.href = "../pages/login.html";
    })
    .catch((error) => {
      console.error("Error writing to Firestore:", error);
      if (error.code === "auth/email-already-in-use") {
        Showmsg("Email already in use.", "signupmsg");
      } else if (error.code === "auth/invalid-email") {
        Showmsg("Invalid email address.", "signupmsg");
      } else if (error.code === "auth/weak-password") {
        Showmsg("Password is too weak.", "signupmsg");
      } else {
        Showmsg(`Signup failed: ${error.message}`, "signupmsg");
      }
    });
});
