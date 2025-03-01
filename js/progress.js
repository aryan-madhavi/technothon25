export function startprogress(totalbotdefeat) {
    // Get user data from localStorage
    
    const maxbots = 23;
    
    const userData = JSON.parse(localStorage.getItem("UserSaveFile"));
    // console.log(userData)
    // const progress = userData['current_level'];

    // Get the progress bar element
    let progressBar = document.getElementById("progressBar");

    if (!progressBar) {
        console.error("Progress bar element not found!");
        return;
    }

    // console.log("Current Level:", progress);

    // Convert progress to percentage (assuming max level is 8)
    let progressPercent = Math.max(0, Math.min(100, (totalbotdefeat / maxbots) * 100));

    // Update localStorage
    // localStorage.setItem("progressLevel", progressPercent);

    // Apply changes to progress bar
    // if (progressPercent == 0)
    //     return;
    progressBar.style.width = progressPercent + "%";
    progressBar.innerHTML = Math.round(progressPercent) + "%";
}
