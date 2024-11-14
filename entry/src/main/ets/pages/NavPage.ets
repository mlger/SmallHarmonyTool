import ClassSchedule from '../view/ClassSchedule/ClassSchedule'
import ScheduleHeader from '../view/ClassSchedule/ScheduleHeader'
import NavViewModel from '../viewmodel/NavViewModel';
import ToolBarData from '../viewmodel/ToolBarData';
import ToolBarComponent from '../view/ToolBarComponent';
import { PERCENTAGE_100, NavPageStyle } from '../common/constants/Constants'
import { CourseData } from '../viewmodel/ClassSchedule/ClassScheduleDataModel';
import ClassScheduleTable from '../common/database/tables/ClassScheduleTable';
import TodoList from '../view/TodoList/TodoList'
import GetWeekAndDate from '../viewmodel/ClassSchedule/GetWeekAndDate'

const CLASS_SCHEDULE: number = 0;
const TODO_LIST: number = 1;
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
  @State courses: CourseData[] = [];
  private classScheduleTable = new ClassScheduleTable(() => {
  });
  @State selectedWeek: number = GetWeekAndDate.getCurrentWeek();
  @State dates: Date[] = GetWeekAndDate.getSevenDaysOfCurrentWeek(this.selectedWeek);

  aboutToAppear() {
    this.toolBarConfigs = viewModel.loadNavigationTab();
  }

  build() {
    Navigation() {
      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        ForEach(this.toolBarConfigs, (item: ToolBarData, index?: number) => {
          TabContent() {
            // if (index === CLASS_SCHEDULE) {
            //   ClassSchedule({
            //     courses: this.courses,
            //     selectedWeek: this.selectedWeek,
            //     dates: this.dates,
            //   })
            // } else if (index === TODO_LIST) {
            //   TodoList()
            // }
            TodoList()
          }
        }, (item: ToolBarData) => JSON.stringify(item))
      }.setTabStyle()
    }
    .toolBar(this.ToolBarBuilder())
    .setNavStyle()
  }

  @Builder
  ToolBarBuilder() {
    ToolBarComponent({
      controller: this.controller,
      toolBarConfigs: this.toolBarConfigs,
      navCurrentPosition: this.navCurrentPosition
    })
      .backgroundColor(Color.White)
      .height(PERCENTAGE_100)
  }

  onPageShow(): void {
    this.updateSchedule(this.selectedWeek);
  }

  /**
   * selectedWeek
   * courses
   */

  updateSelectedWeek(week: number) {
    this.selectedWeek = week;
    this.updateSchedule(week);
    this.dates = GetWeekAndDate.getSevenDaysOfCurrentWeek(week);
  }

  async updateSchedule(week: number) {
    this.classScheduleTable.getRdbStore(() => {
      this.classScheduleTable.getDataByWeek(week, (result: CourseData[]) => {
        this.courses = result;
      });
    });
  }

}