@Entry
@Component
struct DemoGridRow {
  @State bgColors: Color[] = [
    Color.Red,
    Color.Yellow,
    Color.Blue,
    Color.Green,
    Color.Gray,
    Color.White,
    Color.Black,
    Color.Red,
    Color.Yellow,
    Color.Blue,
    Color.Green,
    Color.Gray,

  ]

  build () {
    // 1.多设备自适应布局。自动换行、自动适应屏幕宽度。

    /*
     * 　　断点，栅格系统断点
     * VP像素单位：
     *          XS：最小宽度类型设备[0,320]
     *          SM：小宽度设备类型[320,520]
     *          MD：中等宽度类型设备[520,840]
     *          LG：大宽度类型设备[840,无穷大]
     *          XL：特大宽度
     *          XXL：超大屏幕宽度
     * */
    GridRow ({
      columns:12,
      // 自定义断点代表不同设备宽度
      breakpoints:{
        value:['320vp','520vp','840vp','1080vp'],
        // 断点参考
        reference:BreakpointsReference.WindowSize
      },
      gutter:5,
      direction:GridRowDirection.RowReverse
    }) {
      ForEach (this.bgColors , (item: Color , index: number) => {
        // 注意一点：GridCol (){这里面一定尽量嵌套容器组件}
        // GridCol默认栅格列数为12
        // GridCol宽度是自适应宽度

        GridCol ({
          span: {
            xs: 3,//栅格子组件占用栅格容器的再列，最终列数=columns/xs
            sm: 4,//最终列数=columns/sm
            md: 6,
            lg: 8,
            xl: 10,
            xxl: 12
          }
        }) {
          Row() {
            Text (index.toString())
              .width (80)

          }
        }
        .backgroundColor(item)
      } , (item: string) => item)
    }
  }
}