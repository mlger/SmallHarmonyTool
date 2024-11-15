import router from '@ohos.router';
import http from '@ohos.net.http';
import { webview } from "@kit.ArkWeb";
import ClassScheduleConstants from "../../common/constants/ClassScheduleConstants";
import {  PERCENTAGE_100 } from "../../common/constants/Constants";
import CommonConstants from "../../common/constants/CommonConstants";
import ClassScheduleTable from '../../common/database/tables/ClassScheduleTable'
import { JSON } from '@kit.ArkTS';
import { plainToClass } from 'class-transformer';
import { http_schedule_data } from '../../viewmodel/ClassSchedule/httpGetClassScheduleData'
import { CourseData } from '../../viewmodel/ClassSchedule/ClassScheduleDataModel'
import { prompt } from '@kit.ArkUI';
import GetWeekAndDate from '../../viewmodel/ClassSchedule/GetWeekAndDate'


@Component
export default struct LoadScheduleHeader {
  @State showPrompt: boolean = false;
  @State cookie: string = "";
  private classScheduleTable = new ClassScheduleTable(() => {
  });
  week_now: number = GetWeekAndDate.getCurrentWeek();

  build() {
    Row() {
      Image($rawfile('index/back.svg'))
        .onClick(() => {
          router.back()
        })
        .width(CommonConstants.ICON_WIDTH)

      Column() {
        Text($r('app.string.load_schedule_title'))
          .fontSize(CommonConstants.TITLE_FONT_SIZE)
          .fontWeight(FontWeight.Bold)
        Text(' ')
          .fontSize(CommonConstants.SECOND_TITLE_FONT_SIZE)
      }
      .width(CommonConstants.TITLE_WIDTH)

      Image($rawfile('index/ok.svg'))
        .onClick(() => {
          this.getScheduleData();
        })
        .width(CommonConstants.ICON_WIDTH)
    }
    .width(PERCENTAGE_100)
    .height(CommonConstants.HEADER_HEIGHT)
    .backgroundColor(CommonConstants.ColorHeader)
  }

  async getScheduleData() {
    try {
      const httpRequest = http.createHttp();
      this.cookie = webview.WebCookieManager.fetchCookieSync(ClassScheduleConstants.SERVER)
      console.info("lggcookie: " + this.cookie)

      const dataArray: CourseData[] = [];
      for (let i = 1; i <= 19; i++) {
        const data = await httpRequest.request(
          ClassScheduleConstants.SCHEDULE_URL + "?xssf=bks&xnxqdm=2024-2025-1&zc=" + i,
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
        for (let j = 0; j < ParseData.datas.pkjgList.length; j++) {
          console.log(j.toString());  // 输出当前索引，便于调试
          const raw_data = ParseData.datas.pkjgList[j]; // 获取当前项的数据
          dataArray.push(new CourseData(
            -1,
            i,
            raw_data.KCMC,
            raw_data.JASMC,
            raw_data.SKJSXM,
            raw_data.ZCMC,
            raw_data.XQ,
            raw_data.KSJCDM,
            raw_data.JSJCDM));
        }
      }
      // 1. clear the database
      this.classScheduleTable.deleteAllData(()=>{});
      console.info("dataArray: ", dataArray.toString())

      // 2. store res in the database
      for (let i = 0; i < dataArray.length; i++) {
        this.classScheduleTable.insertData(dataArray[i], (id:number) => {
          dataArray[i].id = id;
        });
      }

      // 3. clear the cookie
      // webview.WebCookieManager.clearAllCookiesSync()
      // 4. return to the main page
      router.back();

    } catch (error) {
      prompt.showToast({message: ClassScheduleConstants.LOAD_ERROR_MESSAGE, bottom: CommonConstants.PROMPT_BOTTOM});
    }
  }
}