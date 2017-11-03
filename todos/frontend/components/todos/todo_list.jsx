import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  render () {
    const {todos, receiveTodo, removeTodo} = this.props;

    const todoItems = todos.map(todo => (
      <TodoListItem
        key={`todo-list-item${todo.id}`}
        todo={todo}
        receiveTodo={receiveTodo}
        removeTodo={removeTodo}>
        {todo.title}
      </TodoListItem>
      )
    );

    return (
      <div>
        <ul>{todoItems}</ul>
        <TodoForm
          receiveTodo={receiveTodo}>
        </TodoForm>
      </div>
    );
  }
}

export default TodoList;
