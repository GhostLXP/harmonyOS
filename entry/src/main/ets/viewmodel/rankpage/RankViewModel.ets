import { RankDataList1, RankDataList2 } from './model/RankModel';
import { RankData } from './RankData';
/**
 * 首页数据获取方式
 */
export class RankViewModel {
  loadIndexDataSource1(): RankData[] {
    return RankDataList1
  }

  loadIndexDataSource2(): RankData[] {
    return RankDataList2
  }
}