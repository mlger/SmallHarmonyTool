@Component
export default struct ScheduleBody {
  build() {
    Row() {
      Column() {
        Row() {
        }.width('100%').height(30).backgroundColor(Color.Red)

        Row() {
        }.width('100%').height(30).backgroundColor(Color.Blue)

        Row() {
        }.width('100%').height(30).backgroundColor(Color.Yellow)
      }.width('30%').height(30).backgroundColor('rgb(242,242,242)')

      Grid() {
        GridItem() {
          Row() {
          }.width('100%').height(30).backgroundColor(Color.Orange)
        }
        GridItem() {
          Row() {
          }.width('100%').height(30).backgroundColor(Color.Red)
        }
        GridItem() {
          Row() {
          }.width('100%').height(30).backgroundColor(Color.Green)
        }
        GridItem() {
          Row() {
          }.width('100%').height(30).backgroundColor(Color.Blue)
        }
        GridItem() {
          Row() {
          }.width('100%').height(30).backgroundColor(Color.Orange)
        }
      }
      .width('30%')
      .columnsTemplate('1fr 2fr 1fr')
      .rowsTemplate('30px 30px 30px')
    }.width('100%') // 确保Row占满页面宽度
    .alignItems(VerticalAlign.Top) // 设置子元素左对齐
  }
}