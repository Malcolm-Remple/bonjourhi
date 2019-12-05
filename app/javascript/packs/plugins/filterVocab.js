const filterVocabByLang = () => {
  const vocabItems = document.querySelectorAll('.vocab-item');
  const langSelector = document.getElementById('vocab_item_language_id');

  langSelector.addEventListener('change', (e) => {
    const langId = e.currentTarget.value;

    // loop trough lang groups and display none on all but current lang
    Array.from(vocabItems).forEach((vocabItem) => {
      if(vocabItem.dataset.langId !== langId) {
         vocabItem.style.display = 'none';
      } else {
         vocabItem.style.display = 'flex';
      }
    });
  });

}

export { filterVocabByLang }
