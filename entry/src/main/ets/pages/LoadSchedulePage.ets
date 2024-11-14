import LoadScheduleBody from '../view/LoadSchedule/LoadScheduleBody';
import LoadScheduleHeader from '../view/LoadSchedule/LoadScheduleHeader';

@Entry
@Component
struct LoadSchedulePage {
  @State message: string = 'Hello World';

  build() {
    Column() {
      LoadScheduleHeader()
      LoadScheduleBody()
    }
  }
}