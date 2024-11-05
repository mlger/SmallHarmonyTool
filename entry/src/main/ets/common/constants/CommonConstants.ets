import relationalStore from '@ohos.data.relationalStore';

export default class CommonConstants {
  /**
   * The host address of the server.
   */
  static readonly SERVER: string = 'https://ehallapp.nju.edu.cn/gsapp/sys/yddwdkbappnju/*default/index.do#/'
  static readonly SCHEDULE_URL: string = 'https://ehallapp.nju.edu.cn/gsapp/sys/yddwdkbappnju/wdkb/getWeekCourseList.do'
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
}