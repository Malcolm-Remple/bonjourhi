const recognizeSpeech = (lang, outputLocation) => {
  console.log(`lang: ${lang}`);
  const recognizeLang = document.getElementById('vocab_item_language_id').value

  const recognition = new webkitSpeechRecognition();
  recognition.lang = 'en';
  recognition.start();

  recognition.addEventListener('result', (event) => {
    if (event.results.length > 0) {
      console.log(event.results[0][0].transcript);
      const transcript = event.results[0][0].transcript;
      outputLocation.value = transcript;
      // toggle animation class
    }
});
};

const listenForMicClick = () => {
  const micButton = document.getElementById('mic-button');
  micButton.addEventListener('click', (e) => {
    // toggle animation class
    // get lang, outputLocation
    const lang = document.getElementById('vocab_item_language_id');
    const outputLocation = document.getElementById('vocab_item_content');
    // call recognizeSpeech
    recognizeSpeech(lang, outputLocation);
  });
};

export { listenForMicClick };
