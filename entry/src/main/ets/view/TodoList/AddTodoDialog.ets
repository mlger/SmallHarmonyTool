import { TodoData } from "../../viewmodel/TodoList/TodoListDataModel";
import { prompt } from "@kit.ArkUI";
import CommonConstants from '../../common/constants/CommonConstants'
import TodoListConstants from '../../common/constants/TodoListConstants'

@CustomDialog
export default struct AddTodoDialog {
  controller?: CustomDialogController;
  @Link todo: TodoData;
  confirm?: (todo: TodoData) => void;
  private inputContent: string = "";

  build() {
    Column() {
      TextInput({
        text: this.inputContent,
      })
        .onChange((value: string) => {
          this.inputContent = value;
        })
        .height('10%')
      Button() {
        Text("Confirm")
      }
      .width(80)
      .height(30)

      .onClick(() => {
        if (this.inputContent === "") {
          prompt.showToast({ message: TodoListConstants.NO_NULL_INPUT, bottom: CommonConstants.PROMPT_BOTTOM })
        } else {
          this.todo.content = this.inputContent;
          this.confirm && this.confirm(this.todo);
          this.controller?.close();
        }
      })
    }
  }
}