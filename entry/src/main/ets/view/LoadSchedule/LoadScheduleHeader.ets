import { ICON_WIDTH, TITLE_FONT_SIZE, TITLE_WIDTH } from "../../common/constants/ClassScheduleConstants";
import { HEADER_HEIGHT, PERCENTAGE_100 } from "../../common/constants/Constants";
import router from '@ohos.router';

@Component
export default struct LoadScheduleHeader {
  build() {
    Row() {
      Button("返回")
        .onClick(() => {
          router.back()
        })
        .width(ICON_WIDTH)

      Column() {
        Text($r('app.string.load_schedule_title'))
          .fontSize(TITLE_FONT_SIZE)
      }
      .width(TITLE_WIDTH)
      .height(PERCENTAGE_100)
      .backgroundColor(Color.Red)
      .alignItems(HorizontalAlign.Center)

      Blank()
        .width(ICON_WIDTH)
    }
    .width(PERCENTAGE_100)
    .height(HEADER_HEIGHT)
    .backgroundColor(Color.Yellow)
  }
}