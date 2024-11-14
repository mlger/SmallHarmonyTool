import { PERCENTAGE_100 } from "../../common/constants/Constants";
import { CourseData } from "../../viewmodel/ClassSchedule/ClassScheduleDataModel";

@CustomDialog
export struct ClassInfoDialog {
  controller?: CustomDialogController;
  @Prop course: CourseData | null;
  private days: string[] = ['周一', '周二', '周三', '周四', '周五', '周六', '周日']

  build() {
    Row() {
      Blank()
        .width('10%')
        .height(PERCENTAGE_100)

      Column() {
        Column() {
          Blank()
            .height('50%')
          Text(this.course?.name)
            .fontSize(20)
        }
        .alignItems(HorizontalAlign.Start)
        .width(PERCENTAGE_100)
        .height('15%')

        Blank()
          .height('5%')
          .width(PERCENTAGE_100)

        Column() {
          Row() {
            Image($rawfile('index/icon_location.svg'))
              .width('10%')
            Blank()
              .width('5%')
            Text(this.course?.location)
              .fontSize(15)
          }
          .height('25%')

          Row() {
            Image($rawfile('index/icon_teacher.svg'))
              .width('10%')
            Blank()
              .width('5%')
            Text(this.course?.teacher)
              .fontSize(15)
          }
          .height('25%')

          Row() {
            Image($rawfile('index/icon_time.svg'))
              .width('10%')
            Blank()
              .width('5%')
            Text(this.getStr())
              .fontSize(15)
          }
          .height('25%')

          Row() {
            Image($rawfile('index/icon_weeks.svg'))
              .width('10%')
            Blank()
              .width('5%')
            Text(this.course?.weeks)
              .fontSize(15)
          }
          .height('25%')

        }
        .height('50%')
        .alignItems(HorizontalAlign.Start)
        .width(PERCENTAGE_100)
      }
      .height(PERCENTAGE_100)
    }
    .width('70%')
    .height('30%')
    .borderRadius(24)
    .backgroundColor(Color.White)
  }

  private getStr(): string {
    if (this.course === null) {
      return ''
    }
    let weekday = this.course.week_day
    return this.days[weekday] + ' ' + '第' + this.course.begin_time + '~' + this.course.end_time + '节'

  }
}