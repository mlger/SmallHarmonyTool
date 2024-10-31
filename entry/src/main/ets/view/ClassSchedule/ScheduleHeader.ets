import { ClassScheduleStyle, HEADER_HEIGHT, PERCENTAGE_100, } from "../../common/constants/Constants"
import { ICON_WIDTH, TITLE_FONT_SIZE, TITLE_WIDTH } from "../../common/constants/ClassScheduleConstants";
import router from '@ohos.router';

@Component
export default struct ScheduleHeader {
  build() {
    Row() {
      Blank()
        .width(ICON_WIDTH)

      Column() {
        Text($r('app.string.class_schedule_title'))
          .fontSize(TITLE_FONT_SIZE)
          .fontWeight(FontWeight.Bold)
        Text("第1周")
          .fontSize(18)
      }
      .alignItems(HorizontalAlign.Center)
      .width(TITLE_WIDTH)

      Button("导入课表")
        .onClick(() => {
          router.pushUrl({ url: 'pages/LoadSchedulePage' })
        })
        .width(ICON_WIDTH)
    }
    .width(PERCENTAGE_100)
    .height(HEADER_HEIGHT)
    .backgroundColor(Color.Yellow)

  }
}