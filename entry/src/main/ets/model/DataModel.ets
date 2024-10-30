import ToolBarData from '../viewmodel/ToolBarData';
import ClassTime from '../viewmodel/ClassScheduleData'

export default class DataModel {
  public static readonly TOOL_BAR: ToolBarData[] = [
    {
      num: 0,
      text: $r('app.string.nav_class_schedule'),
      icon: $rawfile('index/class_schedule.svg'),
      icon_after: $rawfile('index/class_schedule_selected.svg'),
    },
    {
      num: 1,
      text: $r('app.string.nav_todolist'),
      icon: $rawfile('index/todolist.svg'),
      icon_after: $rawfile('index/todolist_selected.svg'),
    }
  ];
  public static readonly CLASS_TIME: ClassTime[] = [
    {
      id: 1,
      begin_time: '08:00',
      end_time: '08:50',
    },
    {
      id: 2,
      begin_time: '09:00',
      end_time: '09:50',
    },
    {
      id: 3,
      begin_time: '10:10',
      end_time: '11:00',
    },
    {
      id: 4,
      begin_time: '11:10',
      end_time: '12:00',
    },
    {
      id: 5,
      begin_time: '14:00',
      end_time: '14:50',
    },
    {
      id: 6,
      begin_time: '15:00',
      end_time: '15:50',
    },
    {
      id: 7,
      begin_time: '16:10',
      end_time: '17:00',
    },
    {
      id: 8,
      begin_time: '17:10',
      end_time: '18:00',
    },
    {
      id: 9,
      begin_time: '18:30',
      end_time: '19:20',
    },
    {
      id: 10,
      begin_time: '19:30',
      end_time: '20:20',
    },
    {
      id: 11,
      begin_time: '20:30',
      end_time: '21:20',
    }
  ]
}