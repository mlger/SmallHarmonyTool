import ClassScheduleConstants from "../../common/constants/ClassScheduleConstants";

@Component
export default struct ScheduleDate {
  colors: Array<Color> = [Color.Red, Color.Yellow, Color.Green, Color.Blue, Color.Pink, Color.Gray, Color.Orange]

  build() {
    Row() {
      Column() {
      }.width(ClassScheduleConstants.TIME_WIDTH).height(ClassScheduleConstants.DATE_HEIGHT).backgroundColor(0xF5DEB3)

      // 使用ForEach循环遍历颜色数组
      ForEach(this.colors, (color: Color, index: number) => {
        Column() {
        }
        .width(ClassScheduleConstants.CLASS_WIDTH)
        .height(ClassScheduleConstants.DATE_HEIGHT)
        .backgroundColor(color)
      })

    }
    .width('100%')
    .height(30)
    .alignItems(VerticalAlign.Bottom)
    .backgroundColor('rgb(242,242,242)')

  }
}