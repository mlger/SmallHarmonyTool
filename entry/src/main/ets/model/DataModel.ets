import ToolBarData from '../viewmodel/ToolBarData';

export default class DataModel {
  public static readonly TOOL_BAR: ToolBarData[] = [
    {
      num: 0,
      text: $r('app.string.nav_class_schedule'),
      icon: $rawfile('index/class_schedule.png'),
      icon_after: $rawfile('index/class_schedule.png'),
    }
  ];
}