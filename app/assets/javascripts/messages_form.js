// if(window.location.href.match(/chats/)){
//   function messageForm(){
//   // submits new message form when user presses Enter (but not shift + enter!)
//   var shiftDown = false;
//   var chatForm = $("#new_message");
//   var messageBox = chatForm.children("textarea");
//   $(document).keypress(function (e) {
//       if(e.keyCode == 13) {
//           if(messageBox.is(":focus") && !shiftDown) {
//             e.preventDefault(); // prevent another \n from being entered
//             chatForm.submit();
//             $(chatForm).trigger('reset');
//           }
//       }
//   });

// // allow message send with button click (claire added)
// $('#send-msg-button').click(function (e) {
//   e.preventDefault();
//   chatForm.submit();
//   $(chatForm).trigger('reset');
// });

// $(document).keydown(function (e) {
//       if(e.keyCode == 16) shiftDown = true;
//   });
// $(document).keyup(function (e) {
//       if(e.keyCode == 16) shiftDown = false;
//   });
// }

// createMessageChannel();
//   // app/assets/javascripts/channels/messages.js
//   messageForm();
//   // app/assets/javascripts/messages_form.js

//   // scroll to bottom of chat on load
//   window.onload=function () {
//      var chatBox = document.getElementById("messages");
//      chatBox.scrollTop = chatBox.scrollHeight;
// }

// }
