import ClassScheduleConstants from "../../common/constants/ClassScheduleConstants";
import { PERCENTAGE_100 } from "../../common/constants/Constants"
import ClassScheduleTable from "../../common/database/tables/ClassScheduleTable";
import { CourseData } from '../../viewmodel/ClassSchedule/ClassScheduleDataModel'

@Component
export default struct ScheduleBody {
  private classScheduleTable = new ClassScheduleTable(() => {
  });
  @State courses: CourseData[] =  [];

  aboutToAppear(): void {
    this.classScheduleTable.getDataByWeek(1, (result: CourseData[])=>{
      this.courses = result;
    });
  }

  build() {
    Row() {
      // TIME
      Column() {
        Row().width(PERCENTAGE_100).height(ClassScheduleConstants.CLASS_HEIGHT).backgroundColor(Color.Red)
        Row().width(PERCENTAGE_100).height(ClassScheduleConstants.CLASS_HEIGHT).backgroundColor(Color.Blue)
      }
      .width(ClassScheduleConstants.TIME_WIDTH)
      .height(PERCENTAGE_100)

      // Column()
      //   .width('100%')
      //   .height(PERCENTAGE_100)
      //   .backgroundColor(0xF5DEB3)
      //
      Grid() {
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr')
      .width(ClassScheduleConstants.CLASS_SUM_WIDTH)
      .height('100%')
    }
    .width(PERCENTAGE_100)

  }
}