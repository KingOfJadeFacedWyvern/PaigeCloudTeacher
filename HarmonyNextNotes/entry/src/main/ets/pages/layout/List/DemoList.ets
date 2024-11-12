@Entry
@Component
struct DemoList {
  @State list: Array<string> = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30','31', '30','31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50', '51', '52', '53', '54', '55','56', '57', '58', '59', '60']
  @State egLanes: LengthConstrain = {minLength: 200, maxLength: 300}
  build () {
    Scroll () {
      Column () {

      // List默认高度为内容高度，如果内容超过屏幕，则List为屏幕高度，会出现滚动条
      // List的子组件内容超过List本身的高度，或者超过屏幕的高度，则会自动出现滚动条
      Text('玉面飞龙之王')
      .width('100%')
      .height(100)
        .backgroundColor (Color.Pink)
      List () {
        ForEach (this.list , (item: string , index: number) => {
          ListItem () {
            Row ({space: 15}) {
              Image ($r ('app.media.WeddingDress'))
                .width(30)
                .borderRadius(50)
              Text (item+'文本')
                .fontSize(35)
            }
            .width ('100%')
            .height (80)
            // .borderRadius(8)
            .backgroundColor (Color.White)
          }
        })
      }
      // 当List的宽度为minLength两倍就会出现多列
      // .width(800)
      // 设置List为横向排列
      .listDirection (Axis.Vertical)
      // 设置List的列数和列宽
      .lanes(1,10)
      // .lanes(this.egLanes)
      // 滚动条状态。
      // .scrollBar(BarState.Off)
      .divider({strokeWidth: 2, color: Color.Red,startMargin:15,endMargin:15})
      // edgeEffect设置边缘滑动的效果，
      .edgeEffect(EdgeEffect.Spring)
      //启动链式联动的动画，这个设置了以后，会影响到样式渲染，space、divider不行，就先取消这个属性
      // .chainAnimation(true)
      // 多选模式,用得不多
      // .multiSelectable(true)
      // 对齐方式
      .alignListItem(ListItemAlign.End)
      // 是否允许滚动交互
      .enableScrollInteraction(true)
        // 父组件和子组件都有需求滚动效果
        .nestedScroll({
          // scrollForward：可滚动组件往未滚动时嵌套滚动选项，从下向上滚动时
          // PARENT_FIRST：父组件先滚动，子组件再滚动
            scrollForward:NestedScrollMode.PARENT_FIRST,
          // scrollBackward：可滚动组件往起始端滚动时嵌套的滚动选项
          // SELF_FIRST：自身先滚动，子组件先滚动，到了父组件才进行父组件的滚动
          // SELF_ONLY：只是子组件自己滚动，父组件不进行滚动
          // PARALLEL：父子组件一起滚动
          scrollBackward:NestedScrollMode.SELF_FIRST,
        })
      .height ('100%')
      //有子组件划入或划出List显示区域时触发。
      //   .onScrollIndex ((start: number, end: number, center: number)=>{
      //     //List显示区域内第一个子组件的索引值。
      //     console.log('start: '+start)
      //     //List显示区域内中间位置子组件的索引值。
      //     console.log('center: '+center)
      //     //List显示区域内最后一个子组件的索引值。
      //     console.log('end: '+end)
      //   })
        .onReachStart(()=>{
          //列表到达起始位置的时候触发
          console.log('列表到达起始位置的是个触发')
        })
      .onReachEnd(()=>{
          //列表到到达未尾位置的时候触发
          console.log('列表到到达未尾位置的时候触发')
        })
        .onScrollFrameBegin ((offset: number, state: ScrollState)=>{
          //列表开始滑动时触发，事件参数传入即将发生滑动量
          //返回是实际滑动的量
          return { offsetRemain:1}
        })
      }
    }
    .width ('100%')
    .height ('100%')
    .padding(10)
    .backgroundColor (Color.Gray)

  }

}