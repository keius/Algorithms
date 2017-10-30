import TodoList from './todo_list';
import {connect} from 'react-redux';
import {allTodos} from '../../reducers/selectors';
import {receiveTodo} from '../../actions/todos_actions';

const mapStateToProps = state => ({
  todos : allTodos(state),
  state
});

const mapDispatchToProps = dispatch => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo))
});

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
