import Rdb from '../Rdb'
import relationalStore from '@ohos.data.relationalStore';

import ClassScheduleConstants from "../../constants/ClassScheduleConstants";
import { CourseData } from '../../../viewmodel/ClassSchedule/ClassScheduleDataModel'

export default class ClassScheduleTable {
  private classScheduleTable = new Rdb(
    ClassScheduleConstants.CLASS_SCHEDULE_TABLE.tableName,
    ClassScheduleConstants.CLASS_SCHEDULE_TABLE.sqlCreate,
    ClassScheduleConstants.CLASS_SCHEDULE_TABLE.columns);

  constructor(callback: Function = () => {
  }) {
    this.classScheduleTable.getRdbStore(callback);
  }

  getRdbStore(callback: Function = () => {
  }) {
    this.classScheduleTable.getRdbStore(callback);
  }

  insertData(course: CourseData, callback: Function) {
    const valueBucket: relationalStore.ValuesBucket = generateBucket(course);
    this.classScheduleTable.insertData(valueBucket, callback);
  }


  deleteData(course: CourseData, callback: Function) {
    let predicates = new relationalStore.RdbPredicates(ClassScheduleConstants.CLASS_SCHEDULE_TABLE.tableName);
    predicates.equalTo('id', course.id);
    this.classScheduleTable.deleteData(predicates, callback);
  }

  deleteAllData(callback: Function) {
    let predicates = new relationalStore.RdbPredicates(ClassScheduleConstants.CLASS_SCHEDULE_TABLE.tableName);
    this.classScheduleTable.deleteData(predicates, callback);
  }

  getDataByWeek(week: number, callback: Function) {
    let predicates = new relationalStore.RdbPredicates(ClassScheduleConstants.CLASS_SCHEDULE_TABLE.tableName);
    predicates.equalTo('week', week);
    this.classScheduleTable.query(predicates, callback);
  }

}

function generateBucket(course: CourseData): relationalStore.ValuesBucket {
  let obj: relationalStore.ValuesBucket = {};
  obj.name = course.name;
  obj.location = course.location;
  obj.teacher = course.teacher;
  obj.weeks = course.weeks;
  obj.week_day = course.week_day;
  obj.begin_time = course.begin_time;
  obj.end_time = course.end_time;
  return obj;
}