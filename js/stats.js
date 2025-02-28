import { initializeApp } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-app.js";
import { getFirestore, doc, updateDoc, getDoc } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-firestore.js";

// Firebase Configuration
const firebaseConfig = {
    apiKey: "AIzaSyBncclJvMPg2JWZ6Xx_og8KWvGCki970V8",
    authDomain: "carbonari-1d14b.firebaseapp.com",
    projectId: "carbonari-1d14b",
    storageBucket: "carbonari-1d14b.firebasestorage.app",
    messagingSenderId: "988846234895",
    appId: "1:988846234895:web:5ad714634aabcd1bdb327a"
};

const app = initializeApp(firebaseConfig);
const db = getFirestore(app);

