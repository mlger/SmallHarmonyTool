import Rdb from '../Rdb'
import relationalStore from '@ohos.data.relationalStore';

import ClassScheduleConstants from "../../constants/ClassScheduleConstants";
import { CourseData } from '../../../viewmodel/ClassSchedule/ClassScheduleDataModel'
import CommonConstants from '../../constants/CommonConstants';

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
    this.classScheduleTable.query(predicates, (resultSet: relationalStore.ResultSet) => {
      let count: number = resultSet.rowCount;
      if (count === 0 || typeof count === 'string') {
        console.log(`${CommonConstants.TABLE_TAG}` + 'Query no results!');
        callback([]);
      } else {
        resultSet.goToFirstRow();
        const result: CourseData[] = [];
        for (let i = 0; i < count; i++) {
          let tmp: CourseData = new CourseData();
          tmp.id = resultSet.getLong(resultSet.getColumnIndex('id'));
          tmp.week = resultSet.getLong(resultSet.getColumnIndex('week'));
          tmp.name = resultSet.getString(resultSet.getColumnIndex('name'));
          tmp.location = resultSet.getString(resultSet.getColumnIndex('location'));
          tmp.teacher = resultSet.getString(resultSet.getColumnIndex('teacher'));
          tmp.weeks = resultSet.getString(resultSet.getColumnIndex('weeks'));
          tmp.week_day = resultSet.getLong(resultSet.getColumnIndex('week_day'));
          tmp.begin_time = resultSet.getLong(resultSet.getColumnIndex('begin_time'));
          tmp.end_time = resultSet.getLong(resultSet.getColumnIndex('end_time'));
          result[i] = tmp;
          resultSet.goToNextRow();
          console.log("tmpid:", tmp.id);
        }
        console.info("query: ", result)
        callback(result);
      }
    });
  }
}

function generateBucket(course: CourseData): relationalStore.ValuesBucket {
  let obj: relationalStore.ValuesBucket = {};
  obj.week = course.week;
  obj.name = course.name;
  obj.location = course.location;
  obj.teacher = course.teacher;
  obj.weeks = course.weeks;
  obj.week_day = course.week_day;
  obj.begin_time = course.begin_time;
  obj.end_time = course.end_time;
  return obj;
}