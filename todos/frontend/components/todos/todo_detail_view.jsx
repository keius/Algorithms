import React from 'react';

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const {todo, removeTodo} = this.props;

    return (
      <div>
        <p>{ todo.body }</p>
        <button onClick={ removeTodo }>Remove Todo!</button>
      </div>
    );
  }
}

export default TodoDetailView;
