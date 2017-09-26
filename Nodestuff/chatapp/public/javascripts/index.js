document.addEventListener('DOMContentLoaded', () => {
  const socket = require('socket.io-client')();
  const ChatUI = require('./chatUI');
  const myChat = new ChatUI(socket);

  socket.on('message', (message) => {
    myChat.addMsg(message.text);
  });
});
