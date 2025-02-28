export function startprogress() {
    // Get user data from localStorage
    const maxlevel = 8;
    
    const userData = JSON.parse(localStorage.getItem("UserSaveFile"));
    // console.log(userData)
    const progress = userData['current_level'];

    // Get the progress bar element
    let progressBar = document.getElementById("progressBar");

    if (!progressBar) {
        console.error("Progress bar element not found!");
        return;
    }

    // console.log("Current Level:", progress);

    // Convert progress to percentage (assuming max level is 8)
    let progressPercent = Math.max(0, Math.min(100, (progress / maxlevel) * 100));

    // Update localStorage
    // localStorage.setItem("progressLevel", progressPercent);

    // Apply changes to progress bar
    progressBar.style.width = progressPercent + "%";
    progressBar.innerHTML = Math.round(progressPercent) + "%";
}
