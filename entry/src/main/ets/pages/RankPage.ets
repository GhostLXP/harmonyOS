import { WEIGHT } from '../common/Constants'
import { TitleComponent } from '../view/TitleComponent'
@Entry
@Component
struct RankPage {
  title: string = '排行榜'
  @State isRefreshPage: boolean = false

  build() {
    Column() {
      TitleComponent({title:this.title, showBackView: true, isRefresh: $isRefreshPage})
    }
    .backgroundColor($r('app.color.background'))
    .height(WEIGHT)
    .width(WEIGHT)
  }
}