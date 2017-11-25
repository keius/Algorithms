import React, { Component } from 'react';
import './Card.css';

class Card extends Component {
  renderLeft() {
    if (this.props.board === 1) {
      return <div></div>;
    } else {
      return <button onClick={this.moveLeft.bind(this)}>{"<"}</button>;
    }
  }

  moveLeft(e) {
    e.preventDefault();
    this.props.moveLeft(this.props.card);
  }

  renderRight() {
    if (this.props.board === 4) {
      return <div></div>;
    } else {
      return <button onClick={this.moveRight.bind(this)}>{">"}</button>;
    }
  }

  moveRight(e) {
    e.preventDefault();
    this.props.moveRight(this.props.card);
  }

  render() {
    return (
      <div className="card-container">
        {this.renderLeft()}
        {this.props.card.body}
        {this.renderRight()}
      </div>
    );
  }
}

export default Card;
