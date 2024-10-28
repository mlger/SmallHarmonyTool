import NavViewModel from '../viewmodel/NavViewModel';
import ToolBarData from '../viewmodel/ToolBarData';
import {PERCENTAGE_100, NavPageStyle} from '../common/Constants/Constants'

const CLASS_SCHEDULE: number = 0;
let viewModel: NavViewModel = new NavViewModel();

@Extend(Navigation) function setNavStyle() {
  .hideTitleBar(true)
  .width(PERCENTAGE_100)
  .height(PERCENTAGE_100)
}

@Extend(Tabs) function setTabStyle() {
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
    }
  }
}