import router from '@ohos.router';
import http from '@ohos.net.http';
import { webview } from "@kit.ArkWeb";
import ClassScheduleConstants from "../../common/constants/ClassScheduleConstants";
import { HEADER_HEIGHT, PERCENTAGE_100 } from "../../common/constants/Constants";
import CommonConstants from "../../common/constants/CommonConstants";
import ClassScheduleTable from '../../common/database/tables/ClassScheduleTable'
import { JSON } from '@kit.ArkTS';
import { plainToClass } from 'class-transformer';
import { http_schedule_data } from '../../viewmodel/httpGetClassScheduleData'

@Component
export default struct LoadScheduleHeader {
  @State showPrompt: boolean = false;
  @State cookie: string = "";
  week_now: number = 8;

  build() {
    Row() {
      Button("返回")
        .onClick(() => {
          router.back()
        })
        .width(ClassScheduleConstants.ICON_WIDTH)

      Column() {
        Text($r('app.string.load_schedule_title'))
          .fontSize(ClassScheduleConstants.TITLE_FONT_SIZE)
      }
      .width(ClassScheduleConstants.TITLE_WIDTH)
      .height(PERCENTAGE_100)
      .backgroundColor(Color.Red)
      .alignItems(HorizontalAlign.Center)


      Button("导入")
        .onClick(() => {
          console.info('Import button clicked');
          this.getScheduleData();
        })
        .width(ClassScheduleConstants.ICON_WIDTH)
    }
    .width(PERCENTAGE_100)
    .height(HEADER_HEIGHT)
    .backgroundColor(Color.Yellow)
  }

  async getScheduleData() {
    try {
      const httpRequest = http.createHttp();
      this.cookie = webview.WebCookieManager.fetchCookieSync(CommonConstants.SERVER)
      console.info("lggcookie: " + this.cookie)

      const dataArray: http_schedule_data[] = [];
      for (let i = 1; i <= 1; i++) {
        const data = await httpRequest.request(
          CommonConstants.SCHEDULE_URL + "?xssf=bks&xnxqdm=2024-2025-1&zc=" + i,
          {
            method: http.RequestMethod.POST,
            header: {
              'Cookie': this.cookie,
            },
          }
        )
        console.info("lgggg: ", data.result);
        const ParseData = JSON.parse(data.result.toString()) as http_schedule_data;
        if (!ParseData.success) {
          throw new Error("Failed to get schedule data");
        }
        dataArray.push(ParseData)


      }


      /*
       after successfully get res:
       1. clear the database
       2. store res in the database
       3. clear the cookie
       4. return to the main page
      */
    } catch (error) {
    }
  }
}