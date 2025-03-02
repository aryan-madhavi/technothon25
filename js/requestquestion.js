

async function getQuestionsFromOpenAI(numQuestions = 5) {
  console.log("Running");
  // const topic = document.getElementById("topic").value;
	// 	const difficulty = document.getElementById("difficulty").value;  
  var topic = "Python BAsics";
  var difficulty = "Hard";
  const k  = "svcacct-K5StdTYEvGzcttBJ_OkX8HuVMSWd-CVBxKQRzTlyy6G8bVT1beLzQUX-xTFtMghilg30BZrT3BlbkFJrBzLa8dMM9nkSRRu7B8G__NsErisC1uaSk0JLkJGNmd7oyoPW2Qz0EKV0TV19n79y_3QXywA";
    
    const kk = "sk-" + k;  // Replace with your OpenAI API Key
    console.log("Api Key: ", kk)
    const url = "https://api.openai.com/v1/chat/completions";

    const prompt = `Generate ${numQuestions} ${difficulty} difficulty multiple-choice questions on ${topic} in JSON format. Each question should have a "question" field, an "options" array (4 choices), and an "answer" field with the correct answer. Do Not Include Any MarkDown Formatting, or specify file format. The format should strictly match:

{
  "assessment": [
    {
      "question": "<question_text>",
      "options": ["<option_1>", "<option_2>", "<option_3>", "<option_4>"],
      "answer": "<correct_option>"
    },
    ...
  ]
}`;

    const response = await fetch(url, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Authorization": `Bearer ${kk}`
        },
        body: JSON.stringify({
            model: "gpt-4o-mini",
            messages: [{ role: "user", content: prompt }]
            // max_tokens: 500
        })
    });
    console.log(prompt);
    const data = await response.json();

    const parseddata = data.choices[0].message.content;
    // const jsonString = JSON.stringify(parseddata);
    const fs = require("fs");
    // const users = require("./try.json");

    fs.writeFile(
      "users.json",
      parseddata,    
      // JSON.stringify(parseddata),
      err => {
          // Checking for errors 
          if (err) throw err;
  
          // Success 
          console.log("Done writing");
      }); 
   
    
  
    // const jsonString = JSON.stringify(data.choices[0].message.content, null, 2);
  
    // // Open file save dialog
    // const handle = await window.showSaveFilePicker({
    //   suggestedName: "data.json",
    //   types: [{ description: "JSON File", accept: { "application/json": [".json"] } }]
    // });
  
    // // Write to file
    // const writable = await handle.createWritable();
    // await writable.write(jsonString);
    // await writable.close();

    // console.log();
    //return JSON.parse(data.choices[0].message.content);
}



getQuestionsFromOpenAI();