const speakText = (text, lang) => {
  let u = new SpeechSynthesisUtterance();

  u.text = text;
  u.lang = lang;

  speechSynthesis.speak(u);
};

const listenForSpeakerClick = () => {
   const vocabItemList = document.getElementById('vocab-item-list');
   vocabItemList.addEventListener('click', (e) => {
     console.log(e);
     // only fire if speaker icon (<i>) was clicked
     if(e.target.nodeName === "I") {
      const text = e.target.dataset.text;
      const lang = 'en';
      console.log(text);
      speakText(text,lang);
     }
   });
};


export { listenForSpeakerClick }
