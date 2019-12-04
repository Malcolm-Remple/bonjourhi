const filterVocabByLang = () => {
  const langSelector = document.getElementById('lang-selector');

  // get all vocab groups (by lang)
  const vocabItemLists = document.querySelectorAll('.vocab-item-list');

  vocabItemLists.forEach((vocabGroup)=> {
    vocabGroup.style.display = 'none';
  });

  vocabItemLists[0].style.display = 'block';

  console.log(vocabItemLists)

  langSelector.addEventListener('change', (e) => {
    const langId = e.currentTarget.value;

    // loop trough lang groups and display none on all but current lang
    Array.from(vocabItemLists).forEach((vocabGroup) => {
      if(vocabGroup.id !== `language-${langId}`) {
         vocabGroup.style.display = 'none';
      } else {
         vocabGroup.style.display = 'block';
      }
    });
  });
}

export { filterVocabByLang }
