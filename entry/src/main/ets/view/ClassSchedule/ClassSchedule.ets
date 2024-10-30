import ScheduleHeader from './ScheduleHeader'
import ScheduleDate from  './ScheduleDate'
import ScheduleBody from './ScheduleBody'
import { PERCENTAGE_100 } from '../../common/constants/Constants'

@Component
export default struct ClassSchedule {
  aboutToAppear() {
  }

  build() {
    Column() {
      ScheduleHeader()
      ScheduleDate()
      ScheduleBody()
    }
    .width(PERCENTAGE_100)
    .height(PERCENTAGE_100)
  }
}
