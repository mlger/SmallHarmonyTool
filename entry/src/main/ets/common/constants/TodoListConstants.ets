import { TodoListTable } from '../../viewmodel/TodoList/TodoListInterface'

export default class TodoListConstants {
  static readonly COLUMN_SPACE: number = 16;
  /**
   * The todolist schedule table config.
   */
  static readonly TODO_LIST_TABLE: TodoListTable = {
    tableName: 'TodoListTable',
    sqlCreate: 'CREATE TABLE IF NOT EXISTS TodoListTable(id INTEGER PRIMARY KEY AUTOINCREMENT, ' +
      'arrair TEXT)',
    columns: ['id', 'affair']
  };
}