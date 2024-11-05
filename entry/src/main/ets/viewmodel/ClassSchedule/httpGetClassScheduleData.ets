import { Type } from "class-transformer";
import { CourseData } from "./ClassScheduleDataModel";

export class json_raw_class_data {
  BJDM: string = "";
  XH: string = "";
  KCDM: string = "";
  KCMC: string = "";
  ZCBH: string = "";
  KSJCDM: number = 0;
  JSJCDM: number = 0;
  XQ: number = 0;
  JASDM: string = "";
  JASMC: string = "";
  SKJSZGH: string = "";
  SKJSXM: string = "";
  XQMC: string = "";
  XKBZ: string = "";
  BYBZ: number = 0;
  ZCMC: string = "";

}

export class json_datas {
  success: boolean = false;
  @Type(() => json_raw_class_data)
  pkjgList: json_raw_class_data[] = [new json_raw_class_data()];
}

export class http_schedule_data {
  success: boolean = false;
  @Type(() => json_datas)
  datas: json_datas = new json_datas();
}