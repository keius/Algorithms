import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import {receiveTodos, receiveTodo} from './actions/todos_actions';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('content');
  const store = configureStore();

  window.store = store;
  window.receiveTodo = receiveTodo;

  ReactDOM.render(<h1>TodoList App</h1>, root);
});
