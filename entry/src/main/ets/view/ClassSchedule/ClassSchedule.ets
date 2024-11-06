import ScheduleHeader from './ScheduleHeader'
import ScheduleDate from './ScheduleDate'
import ScheduleBody from './ScheduleBody'
import { PERCENTAGE_100 } from '../../common/constants/Constants'
import { CourseData } from '../../viewmodel/ClassSchedule/ClassScheduleDataModel';

@Component
export default struct ClassSchedule {
  @Prop courses: CourseData[] = [];

  build() {
    Column() {
      ScheduleHeader()
      ScheduleDate()
      ScheduleBody({
        courses: this.courses
      })
    }
    .width(PERCENTAGE_100)
    .height(PERCENTAGE_100)
  }
}
