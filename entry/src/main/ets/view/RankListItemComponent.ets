/**
 * 排行榜Item组件
 */
import { FontSize, ItemStyle, WEIGHT, FontWeight } from '../common/Constants';

@Component
export struct RankListItemComponent {
  index?: number;
  private name?: string;
  private vote?: string;
  @Prop changeColor: boolean;

  build() {
    Row() {
      Column() {
        if (this.isRenderCircleText()) {
          if (this.index !== undefined) {
            this.CircleText(this.index);
          }
        } else {
          Text(this.index?.toString())
            .lineHeight(ItemStyle.TEXT_LAYOUT_SIZE)
            .textAlign(TextAlign.Center)
            .width(ItemStyle.TEXT_LAYOUT_SIZE)
            .fontWeight(FontWeight.BOLD)
            .fontSize(FontSize.SMALL)
        }
      }
      .width(ItemStyle.LAYOUT_WEIGHT_LEFT)
      .alignItems(HorizontalAlign.Start)

      Text(this.name)
        .width(ItemStyle.LAYOUT_WEIGHT_CENTER)
        .fontWeight(FontWeight.BOLDER)
        .fontSize(FontSize.MIDDLE)
        .fontColor(this.changeColor? ItemStyle.COLOR_BLACK: ItemStyle.COLOR_BLUE)

      Text(this.vote)
        .width(ItemStyle.LAYOUT_WEIGHT_RIGHT)
        .fontWeight(FontWeight.BOLD)
        .fontSize(FontSize.SMALL)
        .fontColor(this.changeColor? ItemStyle.COLOR_BLACK: ItemStyle.COLOR_BLUE)
    }
    .height(ItemStyle.BAR_HEIGHT)
    .width(WEIGHT)
    .onClick(() => {

    })
  }

  @Builder CircleText(index: number) {
    Row() {
      Text(index.toString())
        .fontWeight(FontWeight.BOLD)
        .fontSize(FontSize.SMALL)
        .fontColor(Color.White);
    }
    .justifyContent(FlexAlign.Center)
    .borderRadius(ItemStyle.CIRCLE_TEXT_BORDER_RADIUS)
    .size({ width: ItemStyle.CIRCLE_TEXT_SIZE,
      height: ItemStyle.CIRCLE_TEXT_SIZE })
    .backgroundColor($r('app.color.circle_text_background'))
  }

  isRenderCircleText(): boolean {
    // Just render the element before the fourth in the list.
    return this.index === 1 || this.index === 2 || this.index === 3;
  }
}