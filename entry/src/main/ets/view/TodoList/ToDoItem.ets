/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import TodoListConstants from '../../common/constants/TodoListConstants'
import TodoListTable from '../../common/database/tables/TodoListTable';
import { TodoData } from '../../viewmodel/TodoList/TodoListDataModel';

@Component
export default struct ToDoItem {
  private todoListTable = new TodoListTable(() => {
  })
  @State todo: TodoData = new TodoData()

  @Builder
  labelIcon(icon: Resource) {
    Image(icon)
      .objectFit(ImageFit.Contain)
      .width($r('app.float.checkbox_width'))
      .height($r('app.float.checkbox_width'))
      .margin($r('app.float.checkbox_margin'))
  }

  build() {
    Row() {
      if (this.todo.isComplete) {
        this.labelIcon($r('app.media.ic_ok'));
      } else {
        this.labelIcon($r('app.media.ic_default'));
      }

      Text(this.todo.content)
        .fontSize($r('app.float.item_font_size'))
        .fontWeight(TodoListConstants.FONT_WEIGHT)
        .opacity(this.todo.isComplete ? TodoListConstants.OPACITY_COMPLETED : TodoListConstants.OPACITY_DEFAULT)
        .decoration({ type: this.todo.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None })
    }
    .borderRadius(TodoListConstants.BORDER_RADIUS)
    .backgroundColor($r('app.color.start_window_background'))
    .width(TodoListConstants.LIST_DEFAULT_WIDTH)
    .height($r('app.float.list_item_height'))
    .onClick(() => {
      this.todo.isComplete = 1 - this.todo.isComplete;
      this.updateItem(this.todo);
    })
  }

  aboutToAppear(): void {
    this.todoListTable.getRdbStore(() => {
    })
  }

  updateItem(item: TodoData) {
    this.todoListTable.getRdbStore(() => {
      this.todoListTable.updateData(item, () => {
      })
    })
  }
}