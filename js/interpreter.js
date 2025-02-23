let pyodideReady = (async () => {
    let pyodide = await loadPyodide();
    await pyodide.loadPackage(["numpy", "micropip"]);
    return pyodide;
})();

async function runPython() {
    let pyodide = await pyodideReady;
    let code = document.getElementById("pythoncode").value;

    // Mock the `input()` function to prompt user input in JavaScript
    pyodide.globals.set("input", (msg) => {
        return prompt(msg);  // Uses browser's prompt to take input
    });

    try {
        let formattedCode = JSON.stringify(code);
        let output = await pyodide.runPythonAsync(`
            import sys, os, math, random, datetime, numpy
            from io import StringIO
            sys.stdout = StringIO()  # Redirect stdout
            exec(${formattedCode})  # Execute user code properly
            sys.stdout.getvalue()  # Capture output
        `);

        document.getElementById("output").innerText = output || "No Output"; // Display captured output
    } catch (error) {
        document.getElementById("output").innerText = "Error: " + error;
    }
}

document.getElementById("pythoncode").addEventListener("keydown", function(e) {
    if (e.key === "Tab") {
        e.preventDefault(); // Prevent default tab behavior
        let start = this.selectionStart;
        let end = this.selectionEnd;
        
        // Insert tab character
        this.value = this.value.substring(0, start) + "\t" + this.value.substring(end);
        
        // Move cursor position after the inserted tab
        this.selectionStart = this.selectionEnd = start + 1;
    }
});
