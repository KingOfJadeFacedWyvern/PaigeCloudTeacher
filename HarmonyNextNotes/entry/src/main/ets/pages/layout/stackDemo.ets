

@Entry
@Component
struct StackDemo {
  build () {
    // 排列顺序默认按照写的组件顺序，最后一个组件在最上边
    // 外层Stack只能影响到包裹容器内的所有组件的第一层级
    Stack ({alignContent:Alignment.Center}) {
      Column () {
        Text ('Text1')
      }
      .width (100)
      .height (100)
      .backgroundColor (Color.Pink)
      .zIndex (3)

      Column () {
        Text ('Text2')
        Stack({alignContent:Alignment.TopStart}){

          Text('stack1')
            .width('100')
          Text('stack2')
            .width('50')
        }
        .width (150)
        .height (150)
        .backgroundColor (Color.Orange)
      }
      .width (200)
      .height (200)
      .backgroundColor (Color.Red)
      .offset ({ x: 20 , y: 20 })
      .zIndex (5)

      Column () {
        Text ('Text3')
      }
      .width (100)
      .height (100)
      .backgroundColor (Color.Orange)
      .offset ({ x: 40 , y: 40 })

    }
    .width ('100%')
    .height (300)
    .backgroundColor (Color.Blue)
  }
}
