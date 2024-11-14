
import ToolBarData from '../viewmodel/ToolBarData';
import { AppFontSize, AppFontWeight, PERCENTAGE_100, ToolBarStyle } from '../common/constants/Constants';
import { NavPageStyle } from '../common/constants/Constants';

@Component
export default struct ToolBarComponent {
  @State navCurrentPosition: number = NavPageStyle.POSITION_INITIAL;
  toolBarConfigs: ToolBarData[] = [];
  controller: TabsController = new TabsController();

  build() {
    Column() {
      Divider()
        .backgroundColor(Color.Black)
        .height(ToolBarStyle.DIVIDER_HEIGHT)
        .opacity(ToolBarStyle.DIVIDER_OPACITY)
      Row() {
        ForEach(this.toolBarConfigs, (item: ToolBarData, index?: number) => {
          Column() {
            Image(this.navCurrentPosition === index ? item?.icon_after : item?.icon)
              .height(ToolBarStyle.IMAGE_SIZE)
              .margin({ bottom: ToolBarStyle.MARGIN_BOTTOM })
              .objectFit(ImageFit.Contain)
            Text(item?.text)
              .fontColor(this.navCurrentPosition === index ? $r('app.color.index_navigation_selected_text') : $r('app.color.text'))
              .fontWeight(AppFontWeight.BOLDER)
              .fontSize(AppFontSize.SMALLER)
              .textAlign(TextAlign.Center)
          }
          .width(ToolBarStyle.LAYOUT_WEIGHT)
          .onClick(() => {
            this.navCurrentPosition = item.num
            this.controller.changeIndex(this.navCurrentPosition)
          })
        }, (item: ToolBarData) => JSON.stringify(item))
      }
    }
  }
}

