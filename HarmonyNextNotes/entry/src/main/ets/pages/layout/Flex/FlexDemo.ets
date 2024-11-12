import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct FlexDemo {
  build () {
    // Flex默认的宽度，宽度：当内部有元素时，宽度默认自动填充100%
    // 内部有元素还有有高度的时候，默认为内部元素最高那一个为Flex默认高度
    // alignItems交叉轴对齐方式，上下方向alignItems:ItemAlign.Stretch，自动拉伸填充，如果未设置尺寸。则拉伸到和容器一样大小
    // alignItems:ItemAlign.Baseline:基线对齐方式，第一个参照文本第一行
    Column ({ space: 10 }) {
      Flex ({
        justifyContent: FlexAlign.SpaceEvenly ,
        alignItems: ItemAlign.Baseline ,
      }) {
        Text ('Flex1')
          .fontSize (20)
          .fontColor (Color.White)
          .width (100)
          .height (200)
          .backgroundColor (Color.Blue)
        Text ('Flex2')
          .fontSize (20)
          .fontColor (Color.White)
          .width (100)
          .height (100)
          .backgroundColor (Color.Pink)
        Text ('Flex3')
          .fontSize (20)
          .fontColor (Color.White)
          .width (100)
          .height (100)
          .backgroundColor (Color.Orange)
      }
      .backgroundColor (Color.Yellow)

      // Flex默认宽度超过容器时，内部元素自动压缩
      Flex ({
        direction: FlexDirection.Row ,
        justifyContent: FlexAlign.Start ,
        // alignItems只针对每一行，如果多行也生效，只是一行的对齐方式
        alignItems: ItemAlign.Start ,
        // wrap: FlexWrap.Wrap ,
        // 多行时候alignContent生效，针对交叉轴方向对齐方式
        alignContent: FlexAlign.SpaceEvenly , //多行需要空间
        // FlexAlign.SpaceBetween、FlexAlign.SpaceAround、FlexAlign.SpaceEvenly，设置了以后space不生效
        space: { main: LengthMetrics.vp (20) , cross: LengthMetrics.vp (10) }
      }) {
        Text ('Flex4')
          .fontSize (20)
          .fontColor (Color.White)
          .width (100)
          .height (150)
          .backgroundColor (Color.Green)
          // .alignSelf (ItemAlign.Stretch)// 可以设置子元素父容器交叉轴的对齐方式。单行时才会生效
        Text ('Flex5')
          .fontSize (20)
          .fontColor (Color.White)
          .width ('100%')
          .height (100)
          .backgroundColor (Color.Pink)
          .flexShrink (1200)


        Text ('Flex6')
          .fontSize (20)
          .fontColor (Color.White)
          .width (100)
          .height (100)
          .backgroundColor (Color.Orange)
        // Text('Flex7')
        //   .fontSize(20)
        //   .fontColor(Color.White)
        //   .width(100)
        //   .height(100)
        //   .backgroundColor(Color.Red)
        // Text ('Flex8')
        //   .fontSize (20)
        //   .fontColor (Color.White)
        //   .width ('100%')
        //   .height (100)
        //   .backgroundColor (Color.Brown)// 子元素在父元素主轴方向上的基准尺寸，基准的宽度或者高度
        // .flexBasis(150)
        //　设置父容器的剩余空间配给此属性所在组件的比例
        //   .flexGrow(1)
        //当父容器的剩余空间不足时，子元素压缩比例
        // .flexShrink (50)

      }
      .width ('100%')
      .height (400)
      .backgroundColor (Color.Yellow)
    }
  }
}