import { ClassScheduleTable } from '../../viewmodel/ClassSchedule/ClassScheduleInterface'

export default class ClassScheduleConstants {
  // HEIGHT
  static readonly HEADER_HEIGHT = '10%';
  static readonly DATE_HEIGHT = '5%';
  static readonly BODY_HEIGHT = '80%';
  static readonly PER_CLASS_HEIGHT = '9%';

  static readonly TIME_WIDTH = '11.1%';
  static readonly CLASS_SUM_WIDTH = '88.9%';
  static readonly CLASS_WIDTH = '12.7%';
  static readonly ICON_WIDTH = '10%';
  static readonly TITLE_WIDTH = '80%';
  static readonly TITLE_FONT_SIZE = 24;
  /**
   * The class schedule table config.
   */
  static readonly CLASS_SCHEDULE_TABLE: ClassScheduleTable = {
    tableName: 'ClassScheduleTable',
    sqlCreate: 'CREATE TABLE IF NOT EXISTS ClassScheduleTable (id INTEGER PRIMARY KEY AUTOINCREMENT, ' +
      'week INTEGER, name TEXT, location TEXT, teacher TEXT, weeks TEXT, week_day INTEGER, begin_time INTEGER, ' +
      'end_time INTEGER)',
    columns: ['id', 'week', 'name', 'location', 'teacher', 'weeks', 'week_day', 'begin_time', 'end_time']
  };
  static readonly LOAD_ERROR_MESSAGE = '导入失败, 请检查统一身份验证, 并尝试刷新';
}

