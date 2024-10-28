import { ClassScheduleStyle, PERCENTAGE_100 } from "../../common/constants/Constants"

@Component
export default struct ScheduleHeader {
  build() {
    Row() {
      Column() {
        Text("南哪课表")
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
        Text("第1周")
          .fontSize(18)
      }.alignItems(HorizontalAlign.Center)
    }

  }
}