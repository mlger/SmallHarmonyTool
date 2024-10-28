import NavViewModel from '../viewmodel/NavViewModel';
import ToolBarData from '../viewmodel/ToolBarData';
import ToolBarComponent from '../view/ToolBarComponent';
import { PERCENTAGE_100, NavPageStyle } from '../common/constants/Constants'

const CLASS_SCHEDULE: number = 0;
let viewModel: NavViewModel = new NavViewModel();

@Extend(Navigation)
function setNavStyle() {
  .hideTitleBar(true)
  .width(PERCENTAGE_100)
  .height(PERCENTAGE_100)
}

@Extend(Tabs)
function setTabStyle() {
  .barHeight(NavPageStyle.BAR_HEIGHT)
  .scrollable(false)
}

@Entry
@Component
struct NavPage {
  @State toolBarConfigs: ToolBarData[] = []; // bottom navigation data.
  navCurrentPosition: number = NavPageStyle.POSITION_INITIAL;
  private controller: TabsController = new TabsController();

  aboutToAppear() {
    this.toolBarConfigs = viewModel.loadNavigationTab();
  }

  build() {
    Navigation() {
      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        ForEach(this.toolBarConfigs, (item: ToolBarData, index?: number) => {
          TabContent() {
            if (index === CLASS_SCHEDULE) {
              // HomePage()
            } else {
              // this.HolderPage(item?.text)
            }
          }
        }, (item: ToolBarData) => JSON.stringify(item))
      }.setTabStyle()
    }
    .toolBar(this.ToolBarBuilder())
    .setNavStyle()
  }

  @Builder ToolBarBuilder() {
    ToolBarComponent({
      controller: this.controller,
      toolBarConfigs: this.toolBarConfigs,
      navCurrentPosition: this.navCurrentPosition
    })
      .backgroundColor(Color.White)
      .height(PERCENTAGE_100)
  }
}