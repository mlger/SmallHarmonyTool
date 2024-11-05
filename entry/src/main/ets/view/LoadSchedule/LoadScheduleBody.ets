import { webview } from '@kit.ArkWeb';
import { PERCENTAGE_100 } from '../../common/constants/Constants';
import promptAction from '@ohos.promptAction';
import httpGet from '../../common/utils/HttpUtil';
import http from '@ohos.net.http';
import CommonConstants from '../../common/constants/CommonConstants';

@Component
export default struct LoadScheduleBody {
  controller: webview.WebviewController = new webview.WebviewController();
  @State webSrc: string = CommonConstants.SERVER; // 目标登录页面

  build() {
    Column() {
      Stack() {
        // Web 组件，占据整个屏幕
        Web({ src: this.webSrc, controller: this.controller })
          .zoomAccess(true)
          .height(PERCENTAGE_100)
          .width(PERCENTAGE_100)
          .onPageEnd((event) => {
            console.info('Page finished loading: ' + event.url);
          })

        Column() {

          // 刷新按钮，右上角
          Button('刷新')
            .onClick(() => {
              console.info('Refresh button clicked');
              webview.WebCookieManager.clearAllCookiesSync();
              this.controller.refresh(); // 刷新 Web 页面
            })
            .width(50)// 按钮宽度
            .height(25)// 按钮高度
            .backgroundColor(Color.Blue)
            .fontColor(Color.White)

        }
        .width(60)
        .height(30)
        // .backgroundColor(Color.Blue)
        .alignItems(HorizontalAlign.End)
        .alignSelf(ItemAlign.End)

      }
      .alignContent(Alignment.TopEnd)
    }
  }

  async onRequest() {
    try {
      let result = await httpGet(this.webSrc);
      if (result && result.responseCode === http.ResponseCode.OK) {
        this.controller.clearHistory();
        this.controller.loadUrl(this.webSrc);
      }
    } catch (error) {
      promptAction.showToast({
        message: $r('app.string.http_response_error')
      });
    }
  }
}
