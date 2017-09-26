const Chat = require('./chat');

function ChatUI (socket) {
  this.chat = new Chat(socket);
  this.form = document.querySelector('form');
  this.msgList = document.querySelector('ul#msg-list');
  this.input = document.querySelector('input');
  this.submitHandler();
}

ChatUI.prototype.getInput = function () {
  return this.input.value;
};

ChatUI.prototype.addMsg = function (msg) {
  const newMessage = document.createElement('li');
  newMessage.textContent = msg;
  this.msgList.appendChild(newMessage);
};

ChatUI.prototype.submitHandler = function () {
  this.form.addEventListener('submit', (e) => {
    e.preventDefault();
    this.processUserInput();
    this.input.value = '';
  });
};

ChatUI.prototype.processUserInput = function () {
  const msg = this.getInput();
  this.addMsg(msg);
};

module.exports = ChatUI;
