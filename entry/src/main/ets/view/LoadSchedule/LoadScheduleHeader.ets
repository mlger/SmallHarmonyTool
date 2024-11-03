import ClassScheduleConstants from "../../common/constants/ClassScheduleConstants";
import { HEADER_HEIGHT, PERCENTAGE_100 } from "../../common/constants/Constants";
import router from '@ohos.router';
import http from '@ohos.net.http';
import { webview } from "@kit.ArkWeb";
import CommonConstant from "../../common/constants/CommonConstants";

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
          this.showPrompt = true;
          setTimeout(() => {
            this.showPrompt = false;
          }, 3000)
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
      this.cookie = webview.WebCookieManager.fetchCookieSync(CommonConstant.SERVER)
      console.info("lggcookie: " + this.cookie)

      const data = await httpRequest.request(
        CommonConstant.SCHEDULE_URL + "?xssf=bks&xnxqdm=2024-2025-1&zc=" + this.week_now,
        {
          method: http.RequestMethod.POST,
          header: {
            'Cookie': this.cookie,
          },
          // extraData: {
          //   xssf: 'bks',
          //   xnxqdm: '2024-2025-1',
          //   zc: 8,
          // }

        }

      )
      console.info("lgg: " + data.result)
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