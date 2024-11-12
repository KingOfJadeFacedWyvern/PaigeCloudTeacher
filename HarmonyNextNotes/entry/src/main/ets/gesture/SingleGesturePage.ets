@Entry
@Component
  // 单手手势
  //这个代码，真机才可以测试
struct SingleGesturePage {
  @State offsetX: number = 0
  @State offsetY: number = 0
  @State scaleValueX: number = 0
  @State scaleValueY: number = 0
  @State endX: number = 0
  @State endY: number = 0
  @State scaleValue: number = 1
  @State pinchValue: number = 1
  @State angleValue: number = 0
  @State angleOldValue: number = 0
  @State swipeAngle: number = 0

  build () {
    Column () {
      Text ('点击TapGesture')
        .gesture (
          //手指头点击：第一参数：count点击次数，第二参数：fingers手指头数量
          TapGesture ({ count: 2 , fingers: 2 , })
            .onAction ((event: GestureEvent) => {
              console.log ('是否重复触发主要适用于长按手势' + event.repeat)
              console.log ('手势事件的偏移量VP' + event.offsetX)
              console.log ('旋转手势的旋转角度' + event.angle)
              console.log ('撮合手势' + event.scale)
              console.log ('撮合手势，撮合手势的中心点X' + event.pinchCenterX)
              console.log ('滑动手势速度' + event.speed)
              console.log ('输入源为触屏产生的手势' + JSON.stringify (event.fingerList[0]))
              console.log ('事件的时间戳' + event.timestamp)
              console.log ('手势事件元素对象现实的区域' + event.target.area.width)
              console.log ('事件输入的来源设备' + event.source)
              console.log ('按压的压力大小' + event.pressure)
              console.log ('手写笔在设备平面上的投影和设备平面X轴的夹角' + event.tiltX)
              console.log ('事件输入源' + event.sourceTool)
              console.log ('拖动手势，获取的是当前手势的X轴方向的速度' + event.velocityX)

            })
        )
      Text ('拖动PanGesture')
        .width (200)
        .height (200)
        .padding (20)
        .border ({ width: 3 , color: Color.Red })
        .translate ({ x: this.offsetX , y: this.offsetY , z: 0 })
        .gesture (
          //拖拽手势：第一参数：fingers手指头数量，第二参数：direction用于声明触发拖拽手势的方向，第三参数：distance拖拽距离
          PanGesture ({ fingers: 2 , direction: PanDirection.All , distance: 5 , })

            .onActionStart ((event: GestureEvent) => { //手势开始
              console.log ('手动开始')
            })
            .onActionUpdate ((event: GestureEvent) => { //手势更新
              console.log ('拖动中')

            })
            .onActionEnd ((event: GestureEvent) => { //手势结束
              console.log ('拖动结束')

            })
            .onActionCancel (() => { //手势取消

            })

        )
      Text ('撮合PinchGesture')
        .width (200)
        .height (200)
        .border ({ width: 3 , color: Color.Red })
        .scale ({ x: this.scaleValueX , y: this.scaleValueY , z: 1 })//缩放比例
        .gesture (
          PinchGesture ({ fingers: 2 , distance: 5 , })
            .onActionStart ((event: GestureEvent) => { //手势开始
              console.log ('开始')
            })
            .onActionUpdate ((event: GestureEvent) => { //手势更新
              this.scaleValue = this.pinchValue * event.scale
              console.log ('拖动中')

            })
            .onActionEnd ((event: GestureEvent) => { //手势结束
              this.pinchValue = event.scale

              console.log ('结束')
            })
            .onActionCancel (() => { //手势取消


            })
        )
      Image ($r ('app.media.Ocean'))//旋转手势
        .width (200)
        .aspectRatio (1)
        .rotate ({ angle: this.angleValue })
        .gesture (
          RotationGesture ({ fingers: 2 , angle: 1 })
            .onActionStart ((event: GestureEvent) => {
              console.log ('开始')
            })
            .onActionUpdate ((event: GestureEvent) => {
              if (event) {
                this.angleValue = event.angle + this.angleOldValue
              }
              console.log ('拖动中')

            })
            .onActionEnd ((event: GestureEvent) => {
              if (event) {
                this.angleOldValue = event.angle
              }
              console.log ('结束')
            })

        )
      Image ($r ('app.media.Ocean'))//滑动手势
        .width (200)
        .aspectRatio (1)
        .rotate ({ angle: this.swipeAngle })
        .gesture (
          SwipeGesture ({ fingers: 2 , direction: SwipeDirection.All  })
            .onAction ((event: GestureEvent) => {

              if (event) {
                this.swipeAngle = event.angle

              }


            })
        )
      Text ('长按LongPress')
        .gesture(
          LongPressGesture ({ repeat: true ,fingers: 2 , duration: 1000 })
            .onAction ((event: GestureEvent) => {
              console.log ('开始')
            })
          

        )



    }
    .width ('100%')
    .height ('100%')
  }
}