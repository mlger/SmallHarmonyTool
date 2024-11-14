import CommonConstants from "../../common/constants/CommonConstants"
import { PERCENTAGE_100 } from "../../common/constants/Constants"

@Component
export default struct TodoListHeader {

  build() {
    Row() {
      Blank()
        .width(CommonConstants.ICON_WIDTH)

      Column() {
        Text($r('app.string.TodoListTitle'))
          .fontSize(CommonConstants.TITLE_FONT_SIZE)
          .fontWeight(FontWeight.Bold)
        Text(' ')
          .fontSize(CommonConstants.SECOND_TITLE_FONT_SIZE)
      }
      // .alignItems(HorizontalAlign.Center)
      .width(CommonConstants.TITLE_WIDTH)

      Blank()
        .width(CommonConstants.ICON_WIDTH)
    }
    .width(PERCENTAGE_100)
    .height(CommonConstants.HEADER_HEIGHT)
    .backgroundColor(CommonConstants.ColorHeader)
  }
}