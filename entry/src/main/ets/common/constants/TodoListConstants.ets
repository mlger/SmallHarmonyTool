import { TodoListTable } from '../../viewmodel/TodoList/TodoListInterface'

export default class TodoListConstants {

  /**
   * Full width or height.
   */
  static readonly FULL_LENGTH: string = '100%';
  /**
   * Title height.
   */
  static readonly TITLE_WIDTH: string = '80%';
  /**
   * List default width.
   */
  static readonly LIST_DEFAULT_WIDTH: string = '93.3%';
  /**
   * Opacity of default.
   */
  static readonly OPACITY_DEFAULT: number = 1;
  /**
   * Opacity of default.
   */
  static readonly OPACITY_COMPLETED: number = 0.4;
  /**
   * BorderRadius of list item.
   */
  static readonly BORDER_RADIUS: number = 24;
  /**
   * Font weight 500.
   */
  static readonly FONT_WEIGHT: number = 500;
  /**
   * Space of column.
   */
  static readonly COLUMN_SPACE: number = 16;
  /**
   * agents data.
   */


  /**
   * The todolist schedule table config.
   */
  static readonly TODO_LIST_TABLE: TodoListTable = {
    tableName: 'TodoListTable',
    sqlCreate: 'CREATE TABLE IF NOT EXISTS TodoListTable (id INTEGER PRIMARY KEY AUTOINCREMENT, ' +
      'content TEXT, isComplete INTEGER)',
    columns: ['id', 'content', 'isComplete']
  };

  static readonly NO_NULL_INPUT = '请输入待办事项';
}