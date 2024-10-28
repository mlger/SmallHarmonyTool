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
}
;

/**
 * The style of ToolBarComponent.
 */
export class ToolBarStyle {
  /**
   * The bottom margin.
   */
  static readonly MARGIN_BOTTOM: number = 10;
  /**
   * The size of image.
   */
  static readonly IMAGE_SIZE: number = 24;
  /**
   * The weight of layout.
   */
  static readonly LAYOUT_WEIGHT: string = '25%';
  /**
   * The height of divider.
   */
  static readonly DIVIDER_HEIGHT: number = 0.5;
  /**
   * The opacity of divider.
   */
  static readonly DIVIDER_OPACITY: number = 0.05;
}
;

export class ClassScheduleStyle {
  /**
   * The vertical padding.
   */
  static readonly PADDING_VERTICAL: number = 8;
  /**
   * The horizontal padding.
   */
  static readonly PADDING_HORIZONTAL: number = 16;
  /**
   * The height of blank.
   */
  static readonly BLANK_HEIGHT: number = 15;
}