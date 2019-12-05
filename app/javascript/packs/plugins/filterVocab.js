const addVocabListLoadAnimation = (element) => {
  element.classList.add('animated');
  element.classList.add('flipInX');
};



const filterVocabByLang = () => {
  const langSelector = document.getElementById('vocab_item_language_id');

  // Array.from(vocabItems).forEach((vocabItem) => {
  //   vocabItem.style.display = 'none';
  // };

  langSelector.addEventListener('change', (e) => {
  const vocabItems = document.querySelectorAll('.vocab-item');
    const langId = e.currentTarget.value;


    // loop trough lang groups and display none on all but current lang
    Array.from(vocabItems).forEach((vocabItem) => {
      addVocabListLoadAnimation(vocabItem);
      if(vocabItem.dataset.langId !== langId) {
         vocabItem.style.display = 'none';
      } else {
        vocabItem.style.display = 'flex';
      }
    });
  });

}

export { filterVocabByLang }
