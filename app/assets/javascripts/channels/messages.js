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
    return "<p><img src='" + data.user_photo_url + "' class='bh-avatar-sm'> " + data.message + "</p>";
  },
      });
return App.messages;
}
