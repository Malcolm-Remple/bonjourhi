const filterVocabByLang = () => {
  const langSelector = document.getElementById('lang-selector');

  // get all vocab groups (by lang)
  const vocabItems = document.querySelectorAll('.vocab-item');


  vocabItems.forEach((vocabItem)=> {
    //vocabItem.style.display = 'none';
  });


  langSelector.addEventListener('change', (e) => {
  const langId = e.currentTarget.value;

    // loop trough lang groups and display none on all but current lang
    Array.from(vocabItems).forEach((vocabItem) => {
      if(vocabItem.dataset.langId !== langId) {
         vocabItem.style.display = 'none';
      } else {
         vocabItem.style.display = 'block';
      }
    });
  });

}

export { filterVocabByLang }
