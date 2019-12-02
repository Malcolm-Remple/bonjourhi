function createMessageChannel() {
  App.messages = App.cable.subscriptions.create({
        channel: 'MessagesChannel', chat_id: parseInt($("#message_chat_id").val())
        },
        {
        received: function(data) {
          console.log(data)
          $("#messages").removeClass('hidden')
          return $('#messages').append(this.renderMessage(data));
        },
        renderMessage: function(data) {
    // returns html that mimics _message.html.erb template
    return `<div class="bh-message">
              <img src='${data.user_photo_url}' class='bh-avatar-xs'>
              <div class="bh-message-content">
              ${data.message}
              </div></div>`;
  },
      });
return App.messages;
}
// message template
// <div class="bh-message">
//   <%= image_tag message.user.photo, alt: "photo", class: 'bh-avatar-xs' %>
//   <div class="bh-message-content">
//     <%=message.content%>
//   </div>
// </div>
