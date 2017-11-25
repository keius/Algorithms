import React, { Component } from 'react';
import './Display.css';
import Board from './Board';

class Display extends Component {
  constructor(props) {
    super(props);

    const initialState = {
      1: [{id: 1, body: "card1"}],
      2: [{id: 2, body: "card2"}],
      3: [{id: 3, body: "card3"}],
      4: [{id: 4, body: "card4"}],
    };

    const prev = localStorage.getItem('boards');
    
    if (localStorage.getItem('boards')) {
      this.state = JSON.parse(prev);
    } else {
      this.state = initialState;
    }
  }

  addCard(board, card) {
    const newCards = this.state[board].concat([card]);
    this.setState({[board]: newCards}, () => {
      localStorage.setItem('boards', JSON.stringify(this.state));
    });
  }

  moveLeft(board, card) {
    const oldBoard = this.state[board].filter(oldCard => oldCard.id !== card.id);
    const newBoard = this.state[board - 1].concat([card]);
    this.setState({[board]: oldBoard, [board - 1]: newBoard}, () => {
      localStorage.setItem('boards', JSON.stringify(this.state));
    });
  }

  moveRight(board, card) {
    const oldBoard = this.state[board].filter(oldCard => oldCard.id !== card.id);
    const newBoard = this.state[board + 1].concat([card]);
    this.setState({[board]: oldBoard, [board + 1]: newBoard}, () => {
      localStorage.setItem('boards', JSON.stringify(this.state));
    });
  }

  render() {
    return (
      <div className="display-container">
        <div>
          <h3 className="header1">Winnie</h3>
          <Board
            board={1}
            cards={this.state[1]}
            addCard={this.addCard.bind(this)}
            moveLeft={this.moveLeft.bind(this)}
            moveRight={this.moveRight.bind(this)}>
          </Board>
        </div>
        <div>
          <h3 className="header2">Bob</h3>
          <Board
            board={2}
            cards={this.state[2]}
            addCard={this.addCard.bind(this)}
            moveLeft={this.moveLeft.bind(this)}
            moveRight={this.moveRight.bind(this)}>
          </Board>
        </div>
        <div>
          <h3 className="header3">Thomas</h3>
          <Board
            board={3}
            cards={this.state[3]}
            addCard={this.addCard.bind(this)}
            moveLeft={this.moveLeft.bind(this)}
            moveRight={this.moveRight.bind(this)}>
          </Board>
        </div>
        <div>
          <h3 className="header4">George</h3>
          <Board
            board={4}
            cards={this.state[4]}
            addCard={this.addCard.bind(this)}
            moveLeft={this.moveLeft.bind(this)}
            moveRight={this.moveRight.bind(this)}>
          </Board>
        </div>
      </div>
    );
  }
}

export default Display;
