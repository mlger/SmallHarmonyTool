import Rdb from '../Rdb'
import relationalStore from '@ohos.data.relationalStore';

import TodoListConstants from "../../constants/TodoListConstants";
import { TodoData } from '../../../viewmodel/TodoList/TodoListDataModel'
import CommonConstants from '../../constants/CommonConstants';

export default class TodoListTable {
  private todoListTable = new Rdb(
    TodoListConstants.TODO_LIST_TABLE.tableName,
    TodoListConstants.TODO_LIST_TABLE.sqlCreate,
    TodoListConstants.TODO_LIST_TABLE.columns
  );

  constructor(callback: Function = () => {
  }) {
    this.todoListTable.getRdbStore(callback);
  }

  getRdbStore(callback: Function = () => {
  }) {
    this.todoListTable.getRdbStore(callback);
  }

  insertData(todo: TodoData, callback: Function) {
    console.info(CommonConstants.toStringData(todo))
    const valueBucket: relationalStore.ValuesBucket = generateBucket(todo);
    this.todoListTable.insertData(valueBucket, callback);
  }


  deleteData(todo: TodoData, callback: Function) {
    let predicates = new relationalStore.RdbPredicates(TodoListConstants.TODO_LIST_TABLE.tableName);
    predicates.equalTo('id', todo.id);
    this.todoListTable.deleteData(predicates, callback);
  }

  getAllData(callback: Function) {
    let predicates = new relationalStore.RdbPredicates(TodoListConstants.TODO_LIST_TABLE.tableName);
    this.todoListTable.query(predicates, (resultSet: relationalStore.ResultSet) => {

      let count: number = resultSet.rowCount;
      if (count === 0 || typeof count === 'string') {
        console.log(`${CommonConstants.TABLE_TAG}` + 'Query no results!');
        callback([]);
      } else {
        resultSet.goToFirstRow();
        const result: TodoData[] = [];
        for (let i = 0; i < count; i++) {
          let tmp: TodoData = new TodoData();
          tmp.id = resultSet.getLong(resultSet.getColumnIndex('id'));
          tmp.content = resultSet.getString(resultSet.getColumnIndex('content'));
          tmp.isComplete = resultSet.getLong(resultSet.getColumnIndex('isComplete'));
          result[i] = tmp;
          resultSet.goToNextRow();
        }
        callback(result);
      }
    });
  }

  deleteAllData(callback: Function) {
    let predicates = new relationalStore.RdbPredicates(TodoListConstants.TODO_LIST_TABLE.tableName);
    this.todoListTable.deleteData(predicates, callback);
  }

  updateData(todo: TodoData, callback: Function) {
    let predicates = new relationalStore.RdbPredicates(TodoListConstants.TODO_LIST_TABLE.tableName);
    predicates.equalTo('id', todo.id);
    const valueBucket: relationalStore.ValuesBucket = generateBucket(todo);
    this.todoListTable.updateData(predicates, valueBucket, callback);
  }
}

function generateBucket(todo: TodoData): relationalStore.ValuesBucket {
  let obj: relationalStore.ValuesBucket = {};
  obj.content = todo.content;
  obj.isComplete = todo.isComplete;

  return obj;
}