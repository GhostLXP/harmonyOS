/**
 * 首页列表Item数据bean
 */
export class IndexData {
  index: string;
  name: string;
  pathUrl: string;

  constructor(index: string, name: string, pathUrl: string) {
    this.index = index;
    this.name = name;
    this.pathUrl = pathUrl
  }
}