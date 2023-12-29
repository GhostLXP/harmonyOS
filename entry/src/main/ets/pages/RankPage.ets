/**
 *@State装饰的变量是组件内部的状态数据，当这些状态数据被修改时，将会调用所在组件的build方法进行UI刷新。
 *@Prop与@State有相同的语义，但初始化方式不同。@Prop装饰的变量必须使用其父组件提供的@State变量进行初始化，允许组件内部修改@Prop变量，但更改不会通知给父组件，即@Prop属于单向数据绑定。
 *@Link装饰的变量可以和父组件的@State变量建立双向数据绑定，需要注意的是：@Link变量不能在组件内部进行初始化。
 *@Builder装饰的方法用于定义组件的声明式UI描述，在一个自定义组件内快速生成多个布局内容。
 */
import router from '@ohos.router';
import { Style, WEIGHT } from '../common/Constants'
import { RankListHeaderComponent } from '../view/RankListHeaderComponent';
import { RankListItemComponent } from '../view/RankListItemComponent';
import { TitleComponent } from '../view/TitleComponent'
import { RankData } from '../viewmodel/rankpage/RankData'
import { RankViewModel } from '../viewmodel/rankpage/RankViewModel';

let rankModel: RankViewModel = new RankViewModel();

@Entry
@Component
struct RankPage {
  //JavaScript的逻辑或运算符||。如果router.getParams()?.['src']的值是undefined，null，NaN，0，""（空字符串）或false，那么title的值将会是你指定的默认值。
  @State title: string = router.getParams()?.['src'] || '排行榜'
  @State isRefreshPage: boolean = false
  @State dataSource1: RankData[] = [];
  @State dataSource2: RankData[] = [];

  aboutToAppear() {
    this.dataSource1 = rankModel.loadIndexDataSource1()
    this.dataSource2 = rankModel.loadIndexDataSource2()
  }

  build() {
    Column() {
      TitleComponent({title:this.title.toString(), showBackView: true, isRefresh: $isRefreshPage, showRefreshView: true})
      RankListHeaderComponent({
        paddingValue: {
          left: Style.RANK_PADDING,
          right: Style.RANK_PADDING
        },
        widthValue: Style.CONTENT_WIDTH
      })
        .margin({
          top: Style.HEADER_MARGIN_TOP,
          bottom: Style.HEADER_MARGIN_BOTTOM
        })
      this.RankList(Style.CONTENT_WIDTH)
    }
    .backgroundColor($r('app.color.background'))
    .height(WEIGHT)
    .width(WEIGHT)
  }

  @Builder RankList(widthValue: Length) {
    Column() {
      List() {
        ForEach(this.isRefreshPage? this.dataSource1: this.dataSource2, (item: RankData, index?: number) => {
          ListItem() {
            RankListItemComponent({ index: (Number(index) + 1), name: item.name, vote: item.vote, changeColor :this.isRefreshPage})
          }
        }, (item: RankData) => JSON.stringify(item))
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