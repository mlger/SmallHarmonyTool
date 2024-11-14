import CommonConstants from "../../common/constants/CommonConstants"
import { PERCENTAGE_100 } from "../../common/constants/Constants"
import TodoListConstants from "../../common/constants/TodoListConstants"
import TodoListTable from "../../common/database/tables/TodoListTable"
import { TodoData } from "../../viewmodel/TodoList/TodoListDataModel"
import TodoListBody from "./TodoListBody"
import TodoListHeader from "./TodoListHeader"

@Component
export default struct TodoList {
  build() {
    Column() {
      TodoListHeader()
      TodoListBody()

    }
    .height(PERCENTAGE_100)
  }


}