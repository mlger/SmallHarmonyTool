/**
 * ToolBarData is used to initialize ToolBarComponent.
 */
export default class ToolBarData {
  num: number = 0;
  text: Resource = $r('app.string.nav_class_schedule');
  icon_after: Resource = $rawfile('index/class_schedule.png');
  icon: Resource = $rawfile('index/class_schedule.png');
}