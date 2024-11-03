import { ClassScheduleTable } from '../../viewmodel/ClassScheduleInterface'

export default class ClassScheduleConstants {
  static readonly TIME_WIDTH = '11.1%';
  static readonly CLASS_SUM_WIDTH = '88.9%';
  static readonly CLASS_WIDTH = '12.7%';
  static readonly DATE_HEIGHT = 30;
  static readonly CLASS_HEIGHT = 30;
  static readonly ICON_WIDTH = '10%';
  static readonly TITLE_WIDTH = '80%';
  static readonly TITLE_FONT_SIZE = 24;
  /**
   * The class schedule table config.
   */
  static readonly CLASS_SCHEDULE_TABLE: ClassScheduleTable = {
    tableName: 'ClassScheduleTable',
    sqlCreate: 'CREATE TABLE IF NOT EXISTS accountTable(id INTEGER PRIMARY KEY AUTOINCREMENT, ' + '' +
      'name TEXT, location TEXT, teacher TEXT, weeks TEXT, week_day INTEGER, begin_time INTEGER, ' +
      'end_time INTEGER)',
    columns: ['id', 'name', 'location', 'teacher', 'weeks', 'week_day', 'begin_time', 'end_time']
  };
}
