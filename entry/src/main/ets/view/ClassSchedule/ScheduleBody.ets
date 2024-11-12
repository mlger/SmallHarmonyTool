import ClassScheduleConstants from "../../common/constants/ClassScheduleConstants";
import { PERCENTAGE_100 } from "../../common/constants/Constants"
import ClassScheduleTable from "../../common/database/tables/ClassScheduleTable";
import { ClassTime, CourseData } from '../../viewmodel/ClassSchedule/ClassScheduleDataModel'
import DataModel from '../../model/DataModel'
import { ClassInfoDialog } from "./ClassInfoDialog";
import CommonConstants from "../../common/constants/CommonConstants";

@Component
export default struct ScheduleBody {
  @Prop courses: CourseData[] = [];
  @State classTime: ClassTime[] = [];
  @State selectedCourse: CourseData | null = null;
  classInfoDialogController: CustomDialogController | null = new CustomDialogController({
    builder: ClassInfoDialog({ course: this.selectedCourse }),
    alignment: DialogAlignment.Center,
    offset: { dx: CommonConstants.OFFSET_X, dy: CommonConstants.OFFSET_Y },
    customStyle: true

  });

  build() {
    Row() {
      // TIME
      Column() {
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
        ForEach(this.courses, (item: CourseData, index: number) => {
          GridItem() {
            Column() {
              Blank()
                .width(PERCENTAGE_100)
                .height('2%')

              Text(item.name + '@' + item.location)
                .fontSize(12)
                .fontColor(Color.White)
            }
            .backgroundColor(ClassScheduleConstants.getNewColor())
            .width(PERCENTAGE_100)
            .height(PERCENTAGE_100)
            .borderRadius(6)
            .onClick(() => {
              this.selectedCourse = item;
              this.classInfoDialogController?.open();
            })

          }
          .columnStart(item.week_day)
          .columnEnd(item.week_day)
          .rowStart(item.begin_time)
          .rowEnd(item.end_time)
        })
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