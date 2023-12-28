/**
 * 学习资料首页
 */
import { Style, WEIGHT } from '../common/Constants'
import { IndexListItemComponent } from '../view/IndexListItemComponent';
import { TitleComponent } from '../view/TitleComponent'
import { IndexData } from '../viewmodel/index/IndexData';
import { IndexViewModel } from '../viewmodel/index/IndexViewModel';

let indexModel:IndexViewModel = new IndexViewModel()

@Entry
@Component
struct IndexPage {
  @State isRefreshIndexPage: boolean = true;
  @State dataSource: IndexData[] = [];

  aboutToAppear() {
    this.dataSource = indexModel.loadIndexDataSource()
  }

  build() {
    Column() {
      TitleComponent({title:'鸿蒙学习Demo', isRefresh: $isRefreshIndexPage})
      this.IndexList(Style.CONTENT_WIDTH)
    }
    .backgroundColor($r('app.color.background'))
    .height(WEIGHT)
    .width(WEIGHT)
  }

  @Builder IndexList(widthValue: Length) {
    Column() {
      List() {
        ForEach(this.dataSource, (item: IndexData, index?: number) => {
            ListItem() {
              IndexListItemComponent({ index: (Number(index) + 1), name: item.name })
            }
          }, (item: IndexData) => JSON.stringify(item))
      }
      .width(WEIGHT)
      .height(Style.LIST_HEIGHT)
      .divider({ strokeWidth: Style.STROKE_WIDTH })
    }
    .padding({
      left: Style.RANK_PADDING,
      right: Style.RANK_PADDING
    })
    .borderRadius(Style.BORDER_RADIUS)
    .width(widthValue)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(Color.White)
  }
}
