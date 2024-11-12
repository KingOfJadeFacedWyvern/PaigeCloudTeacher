@Entry
@Component
struct SelectDemo {
  @State text: string = '2'
  build () {
    Column () {
      Select([
        {
          value: '1',
          icon: $r('app.media.app_icon'),
        },
        {
          value: '2',
          icon: $r('app.media.app_icon'),
        },
        {
          value: '3',
          icon: $r('app.media.app_icon'),
        }

      ])
        .selected(1)
        .value(this.text)
        .font({ size: 30,weight: FontWeight.Bold})
        .selectedOptionFontColor(Color.Orange)
        .space(20)
        .arrowPosition(ArrowPosition.END)
        .menuAlign(MenuAlignType.START)
        .optionWidth(200)
        .backgroundColor (Color.Transparent)
    }
  }
}