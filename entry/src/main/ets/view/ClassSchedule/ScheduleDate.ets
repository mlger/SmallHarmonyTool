import ClassScheduleConstants from "../../common/constants/ClassScheduleConstants";
import { PERCENTAGE_100 } from "../../common/constants/Constants";
import { CourseData } from "../../viewmodel/ClassSchedule/ClassScheduleDataModel";
import GetWeekAndDate from "../../viewmodel/ClassSchedule/GetWeekAndDate";

@Component
export default struct ScheduleDate {
  @Prop dates: Date[] = [];

  build() {
    Row() {
      Column() {
        Blank()
          .height('10%')
        Text((this.dates[0].getMonth() + 1) + '月')
          .fontSize(ClassScheduleConstants.Date_FONT_SIZE_TOP)
        Text('^o^')
          .fontSize(ClassScheduleConstants.Date_FONT_SIZE_Bottom)
      }
      .width(ClassScheduleConstants.TIME_WIDTH)
      .height(PERCENTAGE_100)

      // 使用ForEach循环遍历颜色数组
      ForEach(this.dates, (date: Date, index: number) => {
        Column() {
          Blank()
            .height('10%')
          Text(ClassScheduleConstants.weekDays[index])
            .fontSize(ClassScheduleConstants.Date_FONT_SIZE_TOP)
          Text(this.getDateOutput(date))
            .fontSize(ClassScheduleConstants.Date_FONT_SIZE_Bottom)

        }
        .width(ClassScheduleConstants.CLASS_WIDTH)
        .height(PERCENTAGE_100)
        .backgroundColor(GetWeekAndDate.isSameToday(date)? ClassScheduleConstants.getNewColor(): Color.White);
      })

    }
    .width('100%')
    .height(ClassScheduleConstants.DATE_HEIGHT)
    .alignItems(VerticalAlign.Bottom)
  }

  getDateOutput(date: Date): string {
    /**
     * output: 09/10
     */
    let month = date.getMonth() + 1 ;
    let day = date.getDate();
    let monthStr = month.toString();
    let dayStr = day.toString();
    if (month < 10) {
      monthStr = '0' + monthStr;
    }
    if (day < 10) {
      dayStr = '0' + dayStr;
    }
    return monthStr + '/' + dayStr;

  }
}