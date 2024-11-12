@Entry
@Component
struct DemoRelativeContainer {
  build () {
    //默认，所有元素全部对于父容器左上角对齐
    RelativeContainer () {
      Row () {
        Text ('item1')

      }
      .width (60)
      .height (60)
      .backgroundColor (Color.Yellow)
      .alignRules ({
        // left左边对齐、middle中间对齐、right右边对齐使用HorizontalAlign
        // top顶部对齐、center心中对齐、bottom底部对齐使用VerticalAlign

        middle: {
          anchor: '__container__' ,
          align: HorizontalAlign.Center
        } ,
        bottom: {
          anchor: '__container__' ,
          align: VerticalAlign.Bottom
        } ,
      })
      .id ('item1')

      Text ('item2')
        .width (90)
        .height (90)
        .backgroundColor (Color.Red)
        .alignRules ({
          left: {
            anchor: 'item1' ,
            align: HorizontalAlign.End
          } ,
          top: {
            anchor: 'item1' ,
            align: VerticalAlign.Top
          } ,
          right: {
            anchor: 'item1' ,
            align: HorizontalAlign.Start
          } ,
        })
      Text ('item3')
        .width (80)
        .height (80)
        .backgroundColor (Color.Orange)
        .alignRules ({
          // left左边对齐、middle中间对齐、right右边对齐使用HorizontalAlign
          // top顶部对齐、center心中对齐、bottom底部对齐使用VerticalAlign

          // 设置了一个值对齐方式， left、middle、right、top、center、bottom不会影响
          //本身组件的宽高会受到相对布局的影响，看组件本身的宽高，会被相对布局的对齐方式影响
          top: {
            anchor: 'item1' ,
            align: VerticalAlign.Top
          } ,
          bottom: {
            anchor: 'item1' ,
            align: VerticalAlign.Center
          } ,
        })
        Text ('item4')
        .width (100)
        .height (100)
        .backgroundColor (Color.Blue)
        .alignRules ({
          top: {
            anchor: 'line1' ,
            align: VerticalAlign.Bottom
          } ,
          left: {
            anchor: 'line1' ,
            align: HorizontalAlign.End
          } ,
        })
    }
    .width (300)
    .height (300)
    .border ({ width: 2 , color: Color.Pink })
    .margin (10)
    .guideLine ([
      {
        id: 'line1' ,
        direction: Axis.Horizontal ,
        position: { start: 50
      }},
      {
        id: 'line2 ' ,
        direction: Axis.Horizontal ,
        position: { start: 50 } }
    ])
  }
}