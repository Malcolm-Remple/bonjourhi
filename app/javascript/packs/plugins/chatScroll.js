// get chatbox and set scroll height to bottom
const scrollChatBox = () => {
  const chatBox = document.getElementById("messages");
  chatBox.scrollTop = chatBox.scrollHeight;
};

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
    // const new_message = document.querySelector('#messages').lastChild;
    // console.log(new_message);
    // new_message.classList.add('animated', 'slideInUp', 'faster');
  });
};

export { scrollToChatBottomOnLoad, scrollToChatBottomOnMessageAppend };
