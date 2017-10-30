import React from 'react';

class TodoList extends React.Component {
  render () {
    const {todos, receiveTodo} = this.props;

    const todoItems = todos.map(todo => (
      <li>{todo.title}</li>
        // key={`todo-list-item${todo.id}`}
        // todo={todo}
        // receiveTodo={receiveTodo}/>
      )
    );

    return (<ul>{todoItems}</ul>);
  }
}

export default TodoList;
