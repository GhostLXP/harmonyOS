import { IndexData } from './IndexData';
import { IndexDataList } from './model/IndexModel';
/**
 * 首页数据获取方式
 */
export class IndexViewModel {
  loadIndexDataSource(): IndexData[] {
    return IndexDataList
  }
}