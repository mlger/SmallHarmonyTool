@Component
export default struct WeekSelector {
  numbers: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25];
  @Prop onWeekChange : (week: number) => void = (week:number) => {
  };

  build() {
    Scroll() {
      Row() {
        ForEach(this.numbers, (item: number, index: number) => {
          Column() {
            Text('第' + item + '周')
              .fontSize(13)
          }
          .width('13%')
          .alignItems(HorizontalAlign.Center)
          .onClick(() => {
            this.onWeekChange(item)
          })

        });
      }
      .height('100%')
    }
    .height('3%')
    .width('100%')
    .scrollable(ScrollDirection.Horizontal)
    .scrollBarWidth(0)

  }
}