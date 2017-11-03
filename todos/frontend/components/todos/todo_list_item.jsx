import React from 'react';
import merge from 'lodash/merge';
import TodoDetailViewContainer from './todo_detail_view_container';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      detail: false
    };

    this.toggleTodo = this.toggleTodo.bind(this);
    this.toggleDetail = this.toggleDetail.bind(this);
  }

  toggleTodo(e) {
    e.preventDefault();
    const toggledTodo = merge({}, this.props.todo, {done: !this.props.todo.done});
    this.props.receiveTodo(toggledTodo);
  }

  toggleDetail(e) {
    e.preventDefault();
    this.setState({ detail : !this.state.detail });
  }

  render() {
    let detail;
    if (this.state.detail) {
      detail = <TodoDetailViewContainer todo={this.props.todo}/>;
    }
    return (
      <li className="todo-list-item">
        <button onClick={this.toggleDetail}>
          {this.props.todo.title}
        </button>
        <button onClick={this.toggleTodo}>
          { this.props.todo.done ? "Undo" : "Done" }
        </button>
        {detail}
      </li>
    );
  }
}

export default TodoListItem;
