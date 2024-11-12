import ScheduleHeader from './ScheduleHeader'
import ScheduleDate from './ScheduleDate'
import ScheduleBody from './ScheduleBody'
import { PERCENTAGE_100 } from '../../common/constants/Constants'
import { CourseData } from '../../viewmodel/ClassSchedule/ClassScheduleDataModel';
import GetWeekAndDate from '../../viewmodel/ClassSchedule/GetWeekAndDate';
import WeekSelector from './WeekSelector';

@Component
export default struct ClassSchedule {
  @Link courses: CourseData[] = [];
  @Link selectedWeek: number = 1;
  @Link dates: Date[] = GetWeekAndDate.getSevenDaysOfCurrentWeek(this.selectedWeek);


  build() {
    Column() {
      ScheduleHeader({
        selectedWeek: this.selectedWeek,
      })
      WeekSelector({
      })
      ScheduleDate({
        dates: this.dates
      })
      ScheduleBody({
        courses: this.courses
      })
    }
    .width(PERCENTAGE_100)
    .height(PERCENTAGE_100)
  }
}
