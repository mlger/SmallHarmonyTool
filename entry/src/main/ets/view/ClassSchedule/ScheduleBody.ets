import { CLASS_HEIGHT, CLASS_SUM_WIDTH, TIME_WIDTH } from "../../common/constants/ClassScheduleConstants"
import { PERCENTAGE_100 } from "../../common/constants/Constants"

@Component
export default struct ScheduleBody {
  build() {
    Row() {
      // TIME
      Column() {
        Row().width(PERCENTAGE_100).height(CLASS_HEIGHT).backgroundColor(Color.Red)
        Row().width(PERCENTAGE_100).height(CLASS_HEIGHT).backgroundColor(Color.Blue)
      }
      .width(TIME_WIDTH)
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
      .width(CLASS_SUM_WIDTH)
      .height('100%')
    }
    .width(PERCENTAGE_100)

  }
}