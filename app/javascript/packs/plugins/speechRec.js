const recognizeSpeech = (lang, outputLocation) => {

  const recognition = new webkitSpeechRecognition();
  recognition.lang = lang;
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

    // get current lang id in selected in select box
    const selectorLang = document.getElementById('vocab_item_language_id').value
    // translate lang name into iso code using meta-data
    const langCode = document.getElementById('language-meta-'+ selectorLang).dataset.isoCode;
    console.log(langCode)
    const outputLocation = document.getElementById('vocab_item_content');
    // call recognizeSpeech
    recognizeSpeech(langCode, outputLocation);
  });
};

export { listenForMicClick };
