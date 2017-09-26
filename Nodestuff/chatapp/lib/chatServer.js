const io = require('socket.io');

let chat;

const chatServer ={
  listen(server) {
    chat = io(server);

    chat.on('connection', () => {
      console.log("connected");
    });
  }
};

module.exports = chatServer;
