import { webview } from '@kit.ArkWeb';
import { HEADER_HEIGHT, PERCENTAGE_100 } from '../../common/constants/Constants';
import promptAction from '@ohos.promptAction';
import httpGet from '../../common/utils/HttpUtil';
import http from '@ohos.net.http';
import CommonConstant from '../../common/constants/CommonConstants';
import { App, router } from '@kit.ArkUI';
import { ICON_WIDTH, TITLE_FONT_SIZE, TITLE_WIDTH } from '../../common/constants/ClassScheduleConstants';

@Component
export default struct LoadScheduleBody {
  controller: webview.WebviewController = new webview.WebviewController();
  @State webSrc: string = CommonConstant.SERVER; // 目标登录页面

  build() {
    Column() {
      Row() {
        Web({ src: this.webSrc, controller: this.controller })
          .zoomAccess(true)
          .height(PERCENTAGE_100)
          .width(PERCENTAGE_100)
      }
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
