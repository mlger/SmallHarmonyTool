export default class CommonConstant{
  /**
   * The host address of the server.
   */
  static readonly SERVE: string = 'https://ehallapp.nju.edu.cn/jwapp/sys/wdkb/modules/xskcb/cxxskclb.do';
  static readonly SERVER: string = 'https://authserver.nju.edu.cn/';

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