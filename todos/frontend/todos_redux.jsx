import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('content');
  const store = configureStore();

  window.store = store;

  ReactDOM.render(<h1>TodoList App</h1>, root);
});
