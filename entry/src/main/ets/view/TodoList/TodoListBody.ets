import ClassScheduleConstants from "../../common/constants/ClassScheduleConstants"
import CommonConstants from "../../common/constants/CommonConstants"
import { PERCENTAGE_100 } from "../../common/constants/Constants"
import TodoListTable from "../../common/database/tables/TodoListTable"
import { TodoData } from "../../viewmodel/TodoList/TodoListDataModel"
import AddTodoDialog from "./AddTodoDialog"
import ToDoItem from "./ToDoItem"
import TodoListHeader from "./TodoListHeader"

@Component
export default struct TodoListBody {
  private todoListTable = new TodoListTable(() => {
  })
  @State todoList: TodoData[] = []
  @State newTodo: TodoData = new TodoData()
  dialogController: CustomDialogController = new CustomDialogController({
    builder: AddTodoDialog({
      todo: this.newTodo,
      confirm: (todo: TodoData) => this.acceptTodo(todo)

    })
  })

  acceptTodo(todo: TodoData): void {
    todo.isComplete = 0;
    this.todoListTable.getRdbStore(() => {
      this.todoListTable.insertData(todo, (id: number) => {
        todo.id = id;
        console.info("insert id", id)
        this.todoList.push(todo);
      })
    })
  }

  aboutToAppear(): void {
    this.todoListTable.getRdbStore(() => {
      this.todoListTable.getAllData((result: TodoData[]) => {
        this.todoList = result;
        console.info("lggg", result.length)
      })
    })
  }

  build() {
    Stack() {
      Scroll() {
        Column() {
          ForEach(this.todoList, (item: TodoData) => {
            ToDoItem({ todo: item })
          })
        }
        .height(PERCENTAGE_100)
      }

      Button() {
        Image($rawfile('index/add.png'))
      }
      .width($r('app.float.component_size_MP'))
      .height($r('app.float.component_size_MP'))
      .position({ x: CommonConstants.EDIT_POSITION_X, y: CommonConstants.EDIT_POSITION_Y })
      .onClick(() => {
        this.newTodo = new TodoData()
        this.dialogController.open()
      })
    }
    .height(CommonConstants.MAIN_HEIGHT)
    .width(PERCENTAGE_100)
  }
}