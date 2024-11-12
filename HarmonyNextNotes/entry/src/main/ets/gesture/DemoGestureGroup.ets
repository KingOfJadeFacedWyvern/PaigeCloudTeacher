@Entry
@Component
struct DemoGestureGroup {
  build () {
    Column () {
      Image ($r ('app.media.Ocean'))
        .width ('100%')
        .aspectRatio (1)
        .gesture (
          GestureGroup (
            //Sequence顺序手势，组合的所有单一手势，都需要按照书写进行一次触发，所有手势都触发成功才为成功。用得少
            //Parallel并行手势，他们几个单一手势都同时生效，只要有一个手势触发成功，则整个手势为成功。用得多
            //Exclusive互斥手势，有一个手势成功就成功，用得少
            GestureMode.Exclusive ,
            LongPressGesture ({ repeat: true , fingers: 2 , duration: 1000 })
              .onAction ((event: GestureEvent) => {
                console.log ('开始')
              }) ,
            PanGesture ({ fingers: 2  , direction: PanDirection.All , distance: 5 , })

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
        )

    }
    .width ('100%')
    .height ('100%')
  }
}