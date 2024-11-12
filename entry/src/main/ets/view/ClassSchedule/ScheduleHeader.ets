import { ClassScheduleStyle, PERCENTAGE_100, } from "../../common/constants/Constants"
import ClassScheduleConstants from "../../common/constants/ClassScheduleConstants";
import router from '@ohos.router';
import ClassScheduleTable from '../../common/database/tables/ClassScheduleTable';
import { CourseData } from '../../viewmodel/ClassSchedule/ClassScheduleDataModel';
import GetWeekAndDate from '../../viewmodel/ClassSchedule/GetWeekAndDate'
import CommonConstants from "../../common/constants/CommonConstants";

@Component
export default struct ScheduleHeader {
  @Link selectedWeek: number;

  build() {
    Row() {
      Blank()
        .width(CommonConstants.ICON_WIDTH)

      Column() {
        Text($r('app.string.class_schedule_title'))
          .fontSize(CommonConstants.TITLE_FONT_SIZE)
          .fontWeight(FontWeight.Bold)
        Text(this.getWeekOutput(this.selectedWeek))
          .fontSize(18)
      }
      .alignItems(HorizontalAlign.Center)
      .width(CommonConstants.TITLE_WIDTH)

      Image($rawfile('index/download.svg'))
        .onClick(() => {
          router.pushUrl({ url: 'pages/LoadSchedulePage' })
        })
        .width(CommonConstants.ICON_WIDTH)
    }
    .width(PERCENTAGE_100)
    .height(CommonConstants.HEADER_HEIGHT)
    .backgroundColor(CommonConstants.ColorHeader)
    .shadow({
      radius: 10,
      color: Color.Black,
      offsetX: 0,
      offsetY: 5,
    })
  }

  getWeekOutput(week: number): string {
    let output: string = '第' + week + '周';
    if (week != GetWeekAndDate.getCurrentWeek()) {
      output += '[非本周]';
    }
    return output;
  }
}