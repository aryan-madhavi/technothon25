
function getLoggedUserIDfromLocalStorage() {

  return localStorage.getItem('LoggedUserID');

}

function updateSaveFile(level_no,allChallenges) {

  let completedArray = allChallenges.split(" ");

  var saveData = {
    current_level : parseInt(level_no),
    completed: completedArray
  }

  var dataString = JSON.stringify(saveData);

  localStorage.setItem('SavingFile',"true");
  localStorage.setItem('UserSaveFile',dataString);
  
  //localStorage.setItem('current_level',level_no);
  //localStorage.setItem('completed',allChallenges);

}

function resetSaveFile() {
  const resetData = {
    save: {
      current_level: 0,
      completed: []
    }
  };

  localStorage.setItem('UserSaveFile',resetData);
  
  //localStorage.setItem('current_level',0);
  //localStorage.setItem('completed',0);

}

function getSaveFile() {

  return JSON.parse(localStorage.getItem('UserSaveFile'));
  
}

function getSaveLevel() {

  return getSaveFile().current_level;

  //return localStorage.getItem('current_level');
}

function getSaveLevelCompleted() {
  var allChallenges = "";

  getSaveFile().completed.forEach(challenge => {
    allChallenges = allChallenges.concat(challenge," ");
  });
  
  return allChallenges.trim();

  //return localStorage.getItem('completed');
}
