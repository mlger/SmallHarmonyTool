import ScheduleHeader from './ScheduleHeader'
import ScheduleDate from  './ScheduleDate'
import ScheduleBody from './ScheduleBody'

@Component
export default struct ClassSchedule {
  aboutToAppear() {
  }

  build() {
    Column() {
      ScheduleHeader()
        .align(Alignment.Start)
      // ScheduleDate()
      // ScheduleBody()
    }
  }
}
