import ClassScheduleConstants from "../../common/constants/ClassScheduleConstants";
import { PERCENTAGE_100 } from "../../common/constants/Constants"
import ClassScheduleTable from "../../common/database/tables/ClassScheduleTable";
import { ClassTime, CourseData } from '../../viewmodel/ClassSchedule/ClassScheduleDataModel'
import DataModel from '../../model/DataModel'

@Component
export default struct ScheduleBody {
  private classScheduleTable = new ClassScheduleTable(() => {
  });
  @Prop courses: CourseData[] = [];
  @State classTime: ClassTime[] = [];

  build() {
    Row() {
      // TIME
      Column() {
        // Row().width(PERCENTAGE_100).height(ClassScheduleConstants.CLASS_HEIGHT).backgroundColor(Color.Red)
        // Row().width(PERCENTAGE_100).height(ClassScheduleConstants.CLASS_HEIGHT).backgroundColor(Color.Blue)
        ForEach(this.classTime, (item: ClassTime, index: number) => {
          Column() {
            Text(item.id.toString())
              .fontSize(12)
            Text(item.begin_time)
              .fontSize(11)
            Text(item.end_time)
              .fontSize(11)
          }

          .width(PERCENTAGE_100)
          .height(ClassScheduleConstants.PER_CLASS_HEIGHT)
        })


      }
      .width(ClassScheduleConstants.TIME_WIDTH)
      .height(PERCENTAGE_100)

      Grid() {
        GridItem() {
          Column()
            .backgroundColor(Color.Green)
            .width('100%')
            .height('100%')
            .borderRadius(6)
            .onClick(()=>{
              console.info("lggHHHH");
            })
        }
        .columnStart(1)
        .columnEnd(1)
        .rowStart(1)
        .rowEnd(2)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr')
      .width(ClassScheduleConstants.CLASS_SUM_WIDTH)
      .height('99%')
    }
    .width(PERCENTAGE_100)
    .height(ClassScheduleConstants.BODY_HEIGHT)
  }

  aboutToAppear(): void {
    this.classTime = DataModel.CLASS_TIME;
  }

}