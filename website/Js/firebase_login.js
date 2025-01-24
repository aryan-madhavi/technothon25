import { initializeApp } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-app.js";
import { getAuth,signInWithEmailAndPassword} from "https://www.gstatic.com/firebasejs/11.0.2/firebase-auth.js";
// import { getFirestore} from "https://www.gstatic.com/firebasejs/11.0.2/firebase-firestore.js";

const firebaseConfig = {
    apiKey: "AIzaSyBncclJvMPg2JWZ6Xx_og8KWvGCki970V8",
    authDomain: "carbonari-1d14b.firebaseapp.com",
    projectId: "carbonari-1d14b",
    storageBucket: "carbonari-1d14b.firebasestorage.app",
    messagingSenderId: "988846234895",
    appId: "1:988846234895:web:5ad714634aabcd1bdb327a"
};

const app = initializeApp(firebaseConfig);
// const auth = getAuth();
// const db = getFirestore();

function Showmsg(message, divID) {
    var messagediv = document.getElementById(divID);
    messagediv.style.display = "block";
    messagediv.innerHTML = message;
    messagediv.style.opacity = 1;
    setTimeout(function () {
        messagediv.style.opacity = "0";
    }, 5000);
}

const signin = document.getElementById('SubmitLoginIn');
signin.addEventListener('click', (event)=>{
    event.preventDefault();
    const email = document.getElementById('Email').value;
    const password = document.getElementById('Password').value;
    const auth = getAuth();

    signInWithEmailAndPassword(auth, email,  password)
    .then((userCredential)=>{
        Showmsg('Login Successful', 'signupmsg');
        const user = userCredential.user;
        localStorage.setItem('LoggedUserID', user.uid);
        window.location.href = 'index.html';

    })
    .catch((error)=>{
        const errorcode = error.code;
        if(errorcode === 'auth/invalid-credential'){
            Showmsg('Incorrect Email or Password', 'signupmsg');
        }
        else{
            Showmsg("Account Does Not Exist", "signupmsg");
        }
    })
})
