/**
 * 首页列表Item数据bean
 */
export class RankData {
  index: string;
  name: string;
  vote: string;

  constructor(index: string, name: string, vote: string) {
    this.index = index;
    this.name = name;
    this.vote = vote
  }
}