/**
 * 标题组件
 * @Link修饰器管理TitleComponent组件内的状态变量isRefreshData，状态变量isRefreshData值发生改变后，通过@Link装饰器通知父容器页面刷新。
 */
import router from '@ohos.router';
import { FontSize, TitleBarStyle, WEIGHT } from '../common/Constants';
@Component
export struct TitleComponent {
  @State title: string = '';
  @State showBackView: boolean = false
  @State showRefreshView: boolean = false
  @Link isRefresh: boolean;
  build() {
    Row() {
      Row() {
        if (this.showBackView) {
          Image($r('app.media.ic_public_back'))
            .height(TitleBarStyle.IMAGE_BACK_SIZE)
            .width(TitleBarStyle.IMAGE_BACK_SIZE)
            .margin({ right: TitleBarStyle.IMAGE_BACK_MARGIN_RIGHT })
            .onClick(() => {
              router.back()
            })
        }
        //todo 标题居左、居中
        Text(this.title).fontSize(FontSize.LARGE)
      }
      .width(TitleBarStyle.WEIGHT)
      .height(WEIGHT)
      .justifyContent(FlexAlign.Start)

      Row() {
        if (this.showRefreshView) {
          Image($r('app.media.loading'))
            .height(TitleBarStyle.IMAGE_LOADING_SIZE)
            .width(TitleBarStyle.IMAGE_LOADING_SIZE)
            .onClick(() => {
              this.isRefresh = !this.isRefresh;
            })
        }
      }
      .width(TitleBarStyle.WEIGHT)
      .height(WEIGHT)
      .justifyContent(FlexAlign.End)
    }
    .width(WEIGHT)
    .padding({ left: TitleBarStyle.BAR_MARGIN_HORIZONTAL,
      right: TitleBarStyle.BAR_MARGIN_HORIZONTAL })
    .margin({ top: TitleBarStyle.BAR_MARGIN_TOP })
    .height(TitleBarStyle.BAR_HEIGHT)
    .justifyContent(FlexAlign.SpaceAround)
  }
}