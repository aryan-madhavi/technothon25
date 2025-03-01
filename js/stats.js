import { initializeApp } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-app.js";
import { getFirestore, doc, getDoc } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-firestore.js";

// Firebase Configuration
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
    
    return noofbotdefeat;
}

function updateBadge (currentlvl ) {

    badgearray.forEach(function (item, index) {
        if(index < currentlvl){
            item.style.display = "flex";
            item.style.alignItems = "center";
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