// get jquery
import "bootstrap";
import * as $ from 'jquery';
import { scrollToChatBottomOnLoad, scrollToChatBottomOnMessageAppend } from './plugins/chatScroll';
import { listenForSpeakerClick } from './plugins/speechSynthesis';
import { filterVocabByLang, listenForSelectChange } from './plugins/filterVocab';
import { listenForMicClick } from './plugins/speechRec';
// IMPORT SYNTAX:
// import {method_name} from './plugins/filename'
// call the imported function here in application.js



// only load this for /chats/*
if(window.location.href.match(/chats/)){
  console.log('entered applciation.js')
  function messageForm(){
  // submits new message form when user presses Enter (but not shift + enter!)
  var shiftDown = false;
  var chatForm = $("#new_message");
  var messageBox = chatForm.children("textarea");
  $(document).keypress(function (e) {
      if(e.keyCode == 13) {
          if(messageBox.is(":focus") && !shiftDown) {
            e.preventDefault(); // prevent another \n from being entered
            chatForm.submit();
            $(chatForm).trigger('reset');
          }
      }
  });

  // allow message send with button click (claire added)
  $('#send-msg-button').click(function (e) {
    e.preventDefault();
    chatForm.submit();
    $(chatForm).trigger('reset');
  });

  // prevent message send on shift key + enter
  $(document).keydown(function (e) {
        if(e.keyCode == 16) shiftDown = true;
    });
  $(document).keyup(function (e) {
        if(e.keyCode == 16) shiftDown = false;
    });
  }

  createMessageChannel();
  // app/assets/javascripts/channels/messages.js
  messageForm();
  // app/assets/javascripts/messages_form.js
  scrollToChatBottomOnLoad();
  scrollToChatBottomOnMessageAppend();
}

// matches vocab_items#index page only
if(window.location.href.match(/vocab_items/)) {
  listenForSpeakerClick();
  filterVocabByLang();
  listenForSelectChange();
  listenForMicClick();
}

console.log('loaded');
