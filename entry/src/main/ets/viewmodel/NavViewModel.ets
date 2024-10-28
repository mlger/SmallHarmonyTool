import DataModel from '../model/DataModel';
import ToolBarConfig from './ToolBarData';

export default class NavViewModel {
  public loadNavigationTab(): ToolBarConfig[] {
    return DataModel.TOOL_BAR;
  }
}