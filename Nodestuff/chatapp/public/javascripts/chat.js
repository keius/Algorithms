function Chat (socket) {
  this.socket = socket;
}

Chat.prototype.sendMessage = function(message) {
  this.socket.emit('message', {text: message});
  console.log("sent message!");
};

module.exports = Chat;
