export default class CommonConstant{
  /**
   * The host address of the server.
   */
  static readonly SERVER: string = 'https://ehallapp.nju.edu.cn/gsapp/sys/yddwdkbappnju/*default/index.do#/'
  static readonly SCHEDULE_URL: string = 'https://ehallapp.nju.edu.cn/gsapp/sys/yddwdkbappnju/wdkb/getWeekCourseList.do'

  /**
   * The request success code.
   */
  static readonly SUCCESS_CODE: number = 200;

  /**
   * Read timeout.
   */
  static readonly READ_TIMEOUT: number = 50000;

  /**
   * Connect timeout.
   */
  static readonly CONNECT_TIMEOUT: number = 50000;
}