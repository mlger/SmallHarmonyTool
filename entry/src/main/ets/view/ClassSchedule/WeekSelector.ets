import ClassScheduleTable from "../../common/database/tables/ClassScheduleTable";
import { CourseData } from "../../viewmodel/ClassSchedule/ClassScheduleDataModel";
import GetWeekAndDate from "../../viewmodel/ClassSchedule/GetWeekAndDate";

@Component
export default struct WeekSelector {
  private classScheduleTable = new ClassScheduleTable(() => {
  });
  numbers: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25];
  @Link selectedWeek: number;
  @Link courses: CourseData[];
  @Link dates: Date[];

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
            this.selectedWeek = item;
            this.dates = GetWeekAndDate.getSevenDaysOfCurrentWeek(item);
            this.updateSchedule(item)
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
  async updateSchedule(week: number) {

    this.classScheduleTable.getRdbStore(() => {
      this.classScheduleTable.getDataByWeek(week, (result: CourseData[]) => {
        this.courses = result;
      });
    });
  }
}