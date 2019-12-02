// get chatbox and set scroll height to bottom
const chatBox = document.getElementById("messages");

const scrollChatBox = () => {
  chatBox.scrollTop = chatBox.scrollHeight;
};

// const scrollNewMessage = () => {
//   chatBox.scrollTop = chatBox.scrollBy({
//     top: chatBox.scrollHeight, // could be negative value
//     left: 0,
//     behavior: 'smooth'
//   });
// }
// scroll to bottom of chat on load
const scrollToChatBottomOnLoad = () => {
  window.onload = () => {
    scrollChatBox();
  }
}
// scroll to bottom of chat box on new message added
const scrollToChatBottomOnMessageAppend = () => {
  document.getElementById('messages').addEventListener('DOMNodeInserted', (e) => {

    scrollChatBox();
    // animate entrance
    const new_message = document.querySelector('#messages').lastElementChild;

    new_message.classList.add('animated', 'slideInUp' );
  });
};

export { scrollToChatBottomOnLoad, scrollToChatBottomOnMessageAppend };
