@Entry
@Component
struct SpamPage {
  build () {
    // 1.如果Text的子组件有定义，则Text本身的内容则不会展示
    // 2.Span中无法使用.backgroundColor相关, 只能使用.textBackgroundStyle的属性
    // 3.width和height设置宽度和高度无效
    Text () {
      ContainerSpan () {
        //  Span不会独占一行
        Span ('文本内容')// 下划线
          .decoration ({ type: TextDecorationType.Underline })
        // Span ('文本内容')
        //   // 文本大小写
        //   .textCase (TextCase.UpperCase)
        Span ('文本内容')// 文本背景颜色还可以改变半径
          .textBackgroundStyle ({ color: Color.Red , radius: 10 })

        Span ('文本内容')// 文本阴影
          .textShadow ({
            radius: 10 ,
            color: Color.Black ,
            type: ShadowType.COLOR ,
            offsetX: 50
          })// 文本背景颜色还可以改变半径
          .textBackgroundStyle ({ color: Color.Blue , radius: 10 })

        // ImageSpan宽度和高度可以控制图片的大小
        // verticalAlign(ImageSpanAlignment.)图片和文字的对齐方式
        ImageSpan ($r ('app.media.app_icon'))
          .width (65)
          .verticalAlign (ImageSpanAlignment.BASELINE)



      }
      // 用来显示小图标的，默认加载是系统的内置资源
      // SymbolSpan只能加载系统内置的sys.symbol,开头的内置图标资源
      SymbolSpan($r('sys.symbol.ohos_folder_badge_plus'))
        // 设置SymbolSpan渲染策略。$r('sys.symbol.ohos_*')中引用的资源仅ohos_folder_badge_plus支持分层与多色模式。
        .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR)
        .fontSize(45)
        .fontColor([Color.Red, Color.Blue ])


    }
  }
}