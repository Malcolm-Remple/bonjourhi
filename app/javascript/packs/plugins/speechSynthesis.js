const speakText = (text, lang) => {
  let u = new SpeechSynthesisUtterance();

  u.text = text;
  u.lang = lang;

  speechSynthesis.speak(u);
};

const listenForSpeakerClick = () => {
   const vocabItemList = document.querySelectorAll('.vocab-item-list');
   vocabItemList.forEach((vocabGroup) => {
     vocabGroup.addEventListener('click', (e) => {

     // only fire if speaker icon (<i>) was clicked
      if(e.target.nodeName === "I") {
        const text = e.target.dataset.text;
        const lang = e.target.dataset.isoCode;
        console.log(text);
        speakText(text,lang);
      }
    });
  });
};


export { listenForSpeakerClick }
