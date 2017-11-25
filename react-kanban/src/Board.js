import React, { Component } from 'react';
import './Board.css';
import Card from './Card';

class Board extends Component {
  renderCards() {
    return this.props.cards.map(card => (
      <Card
        card={card}
        board={this.props.board}
        moveLeft={this.moveLeft.bind(this)}
        moveRight={this.moveRight.bind(this)}>
      </Card>
    ));
  }

  addCard(e) {
    e.preventDefault();

    const body = prompt("Card text?");
    const id = new Date();
    const newCard = {id: id, body: body};

    this.props.addCard(this.props.board, newCard);
  }

  moveLeft(card) {
    this.props.moveLeft(this.props.board, card);
  }

  moveRight(card) {
    this.props.moveRight(this.props.board, card);
  }

  render() {
    return (
      <div className="board-container">
        {this.renderCards.bind(this)()}
        <button onClick={this.addCard.bind(this)}>Add Card</button>
      </div>
    );
  }
}

export default Board;
