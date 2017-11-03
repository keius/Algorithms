import TodoDetailView from './todo_detail_view';
import {connect} from 'react-redux';
import {removeTodo} from '../../actions/todos_actions';

const mapDispatchToProps = (dispatch, {todo}) => ({
  removeTodo: () => dispatch(removeTodo(todo))
});

export default connect(null, mapDispatchToProps)(TodoDetailView);
