/**
 * The font weight of application.
 */
enum AppFontWeight {
  BOLD = '400',
  BOLDER = '500',
};

/**
 * The font size of application.
 */
enum AppFontSize {
  SMALLER = 13,
  SMALL = 14,
  MIDDLE = 16,
  LARGE = 20,
  LARGER = 35,
};

export { AppFontSize, AppFontWeight };

/**
 * The percentage of 100.
 */
export const PERCENTAGE_100 = '100%';

/**
 * The style of NavPage.
 */
export class NavPageStyle {
  /**
   * The height of Tabs.
   */
  static readonly BAR_HEIGHT: number = 0;

  /**
   * The default position of Tabs.
   */
  static readonly POSITION_INITIAL: number = 0;
};