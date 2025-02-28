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

const docname = document.getElementById("PlayerName");
// const doctimeplayed = document.getElementById("PlayedTime");
// const LoggedInUserId = localStorage.getItem('LoggedInUserId')
// const userRef = doc(db, "user", LoggedInUserId);
// const docSnap = await getDoc(userRef);



const name = localStorage.getItem("LoggedUsername")
// const timeplayed = localStorage.getItem("TimePlayed");

const badge1 = document.getElementById("badge1")
const badge2 = document.getElementById("badge2")
const badge3 = document.getElementById("badge3")
const badge4 = document.getElementById("badge4")
const badge5 = document.getElementById("badge5")
const badge6 = document.getElementById("badge6")
const badge7 = document.getElementById("badge7")
const badge8 = document.getElementById("badge8")

const badgearray = [badge1, badge2, badge3, badge4, badge5, badge6, badge7, badge8]

const docbotdefeated = document.getElementById("BotDefeated");
//Level : No of Challange
const levelnchalange = {
    1 : 3,
    2 : 3,
    3 : 2, 
    4 : 3,
    5 : 3, 
    6 : 3,
    7 : 3,
    8 : 3
}

function updatebotdefeated (currentlvl, lenofcurrentcompletedlevel) {
    let noofbotdefeat = parseInt(0);
    for(let level in levelnchalange){
        if (level < currentlvl){
            noofbotdefeat += levelnchalange[level];
        }
    }
    noofbotdefeat +=lenofcurrentcompletedlevel;
    // console.log("Bot Defeat : ", noofbotdefeat);
    docbotdefeated.innerText = `Bot Defeated : ${noofbotdefeat}`

}

function updateBadge (currentlvl) {

    badgearray.forEach(function (item, index) {
        if(index < currentlvl- 1){
            item.style.display = "block";
        } else{
            item.style.display = "none";
        }
    });
}

function updateName () {
    docname.innerText = `Hello, ${name}`;
}


updateName()

export { updateBadge, updatebotdefeated}