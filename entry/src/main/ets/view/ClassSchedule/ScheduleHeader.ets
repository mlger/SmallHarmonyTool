import { ClassScheduleStyle, HEADER_HEIGHT, PERCENTAGE_100, } from "../../common/constants/Constants"
import ClassScheduleConstants from "../../common/constants/ClassScheduleConstants";
import router from '@ohos.router';
import ClassScheduleTable from "../../common/database/tables/ClassScheduleTable";
import { CourseData } from "../../viewmodel/ClassSchedule/ClassScheduleDataModel";

@Component
export default struct ScheduleHeader {
  private classScheduleTable = new ClassScheduleTable(() => {
  });
  build() {
    Row() {
      // Blank()
      //   .width(ClassScheduleConstants.ICON_WIDTH)

      Button("导入课表")
        .onClick(()=>{
          this.query()
        })
        .width(ClassScheduleConstants.ICON_WIDTH)

      Column() {
        Text($r('app.string.class_schedule_title'))
          .fontSize(ClassScheduleConstants.TITLE_FONT_SIZE)
          .fontWeight(FontWeight.Bold)
        Text("第1周")
          .fontSize(18)
      }
      .alignItems(HorizontalAlign.Center)
      .width(ClassScheduleConstants.TITLE_WIDTH)

      Button("导入课表")
        .onClick(() => {
          router.pushUrl({ url: 'pages/LoadSchedulePage' })
        })
        .width(ClassScheduleConstants.ICON_WIDTH)
    }
    .width(PERCENTAGE_100)
    .height(HEADER_HEIGHT)
    .backgroundColor(Color.Yellow)

  }

  aboutToAppear(): void {
    this.classScheduleTable.getDataByWeek(1, (result: CourseData[]) => {
      console.info("result length: ", result.length)
      console.info("result: ", result.toString())
    });
  }
  query(): void {
    this.classScheduleTable.getDataByWeek(1, (result: CourseData[]) => {
      console.info("result length: ", result.length)
      console.info("result: ", result.toString())
    });
  }
}