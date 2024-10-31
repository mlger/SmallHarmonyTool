import { ICON_WIDTH, TITLE_FONT_SIZE, TITLE_WIDTH } from "../../common/constants/ClassScheduleConstants";
import { HEADER_HEIGHT, PERCENTAGE_100 } from "../../common/constants/Constants";
import router from '@ohos.router';
import http from '@ohos.net.http';
import { webview } from "@kit.ArkWeb";
import CommonConstant from "../../common/constants/CommonConstants";

@Component
export default struct LoadScheduleHeader {
  @State showPrompt: boolean = false;
  @State cookie: string = "";

  build() {
    Row() {
      Button("返回")
        .onClick(() => {
          router.back()
        })
        .width(ICON_WIDTH)

      Column() {
        Text($r('app.string.load_schedule_title'))
          .fontSize(TITLE_FONT_SIZE)
      }
      .width(TITLE_WIDTH)
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
        .width(ICON_WIDTH)
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
        CommonConstant.SCHEDULE_URL,
        {
          method: http.RequestMethod.POST,
        }
      )
      console.info("lgg: " + data.result)
    } catch (error) {
    }
  }
}