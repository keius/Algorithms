import React from 'react';
import {uniqueId} from '../../util/util';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }


  update(property) {
    return (e) => this.setState({[property]: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    const todo = Object.assign({}, this.state, { id: uniqueId() });
    this.props.receiveTodo(todo);
    this.setState({
      title: "",
      body: ""
    });
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>Title:
          <input
            value={this.state.title}
            placeholder="buy milk"
            onChange={this.update('title')}>
          </input>
        </label>

        <label>Body:
          <textarea
            value={this.state.body}
            placeholder="2% or whatever is on sale!"
            onChange={this.update('body')}>
          </textarea>
        </label>

        <button>Create Todo!</button>
      </form>
    );
  }
}

export default TodoForm;
