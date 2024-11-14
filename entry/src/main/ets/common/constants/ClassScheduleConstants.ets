import { ClassScheduleTable } from '../../viewmodel/ClassSchedule/ClassScheduleInterface'

export default class ClassScheduleConstants {
  // HEIGHT
  static readonly DATE_HEIGHT = '5%';
  static readonly BODY_HEIGHT = '80%';
  static readonly PER_CLASS_HEIGHT = '9%';
  // WIDTH
  static readonly TIME_WIDTH = '11.1%';
  static readonly CLASS_SUM_WIDTH = '88.9%';
  static readonly CLASS_WIDTH = '12.7%';
  // FONT
  static readonly Date_FONT_SIZE_TOP = 13;
  static readonly Date_FONT_SIZE_Bottom = 12;

  /**
   * Http
   */
  static readonly SERVER: string = 'https://ehallapp.nju.edu.cn/gsapp/sys/yddwdkbappnju/*default/index.do#/'
  static readonly SCHEDULE_URL: string = 'https://ehallapp.nju.edu.cn/gsapp/sys/yddwdkbappnju/wdkb/getWeekCourseList.do'

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
  static readonly colorList =
    ['#8AD297', '#F9A883', '#88CFCC', '#F19C99',
      '#F7C56B', '#D2A596', '#67BDDE', '#9CCF5A',
      '#9AB4CF', '#E593AD', '#82db23a1', '#B29FD2']
  static colorListIndex: number = 0;

  static getNewColor(): string {
    let color: string = ClassScheduleConstants.colorList[ClassScheduleConstants.colorListIndex];
    ++ClassScheduleConstants.colorListIndex;
    ClassScheduleConstants.colorListIndex %= ClassScheduleConstants.colorList.length;
    return color;
  }

  static readonly weekDays: string[] = ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
}

