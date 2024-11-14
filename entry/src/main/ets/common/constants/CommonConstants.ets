import relationalStore from '@ohos.data.relationalStore';
import { TodoData } from '../../viewmodel/TodoList/TodoListDataModel';

export default class CommonConstants {
  /**
   * The host address of the server.
   */
  static readonly SUCCESS_CODE: number = 200;
  static readonly READ_TIMEOUT: number = 50000;
  static readonly CONNECT_TIMEOUT: number = 50000;
  /**
   * Log tag.
   */
  static readonly RDB_DOMAIN = 0x01;
  static readonly RDB_TAG = '[Debug.Rdb]';
  static readonly TABLE_TAG = '[Debug.ClassScheduleTable]';
  /**
   * Rdb database config.
   */
  static readonly STORE_CONFIG: relationalStore.StoreConfig = {
    name: 'database.db',
    securityLevel: relationalStore.SecurityLevel.S1
  };
  static readonly PROMPT_BOTTOM = '70vp';
  // HEADER
  // HEIGHT
  static readonly HEADER_HEIGHT = '10%';
  static readonly MAIN_HEIGHT = '90%';
  // COLOR
  static readonly ColorHeader = '#cc3fedd3';
  // FONT
  static readonly TITLE_FONT_SIZE = 24;
  static readonly SECOND_TITLE_FONT_SIZE = 14;
  static readonly ICON_WIDTH = '7%';
  static readonly TITLE_WIDTH = '86%';
  /**
   * String for input content.
   */
  static readonly OFFSET_X: number = 0;
  /**
   * String for input content.
   */
  static readonly OFFSET_Y: number = -25;
  static readonly EDIT_POSITION_X = '40%';
  static readonly EDIT_POSITION_Y = '5%';

  static toStringData(data: TodoData): string {
    return `id: ${data.id}, content: ${data.content}, isComplete: ${data.isComplete}`;

  }
}