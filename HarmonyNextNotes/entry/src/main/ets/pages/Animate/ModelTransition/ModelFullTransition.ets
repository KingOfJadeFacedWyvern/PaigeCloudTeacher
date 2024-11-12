@Entry
@Component
struct ModelFullTransition {
  @State isShow: boolean = false
  @State isShow2: boolean = false

  @Builder
  myBuilder2 () {
    Column () {
      Button ('Close Model 2').onClick (() => {
        this.isShow2 = false
      })
        .margin (10)
        .fontSize (20)
    }
    .width ('100%')
    .height ('100%')
  }
  @Builder
  myBuilder () {
    Column () {
      Button ('Transition Model 2').onClick (() => {
        this.isShow2 = true
      })
        .margin (10)
        .fontSize (20)

        .bindContentCover (this.isShow2 , this.myBuilder2 () , {
          // NONE	全屏模态无转场动画。
          // DEFAULT	全屏模态上下切换动画。
          // ALPHA	全屏模态透明度渐变动画。
          modalTransition: ModalTransition.NONE ,
          backgroundColor: Color.Orange ,
          onWillAppear: () => {
            console.log ("BindContentCover onWillAppear.")
          } ,
          onAppear: () => {
            console.log ("BindContentCover onAppear.")
          } ,
          onWillDisappear: () => {
            console.log ("BindContentCover onWillDisappear.")
          } ,
          onDisappear: () => {
            console.log ("BindContentCover onDisappear.")
          }
        })

      Button ('Close Model 1').onClick (() => {
        this.isShow = false
      })
        .margin (10)
        .fontSize (20)
    }
    .width ('100%')
    .height ('100%')

  }



  build () {
    Column () {
      Button ('Transition Model 1').onClick (() => {
        this.isShow = true
      })
        .margin (10)
        .fontSize (20)
        .bindContentCover (this.isShow , this.myBuilder () , {
          // NONE	全屏模态无转场动画。
          // DEFAULT	全屏模态上下切换动画。
          // ALPHA	全屏模态透明度渐变动画。
          modalTransition: ModalTransition.ALPHA,
          backgroundColor: Color.Pink,
          onWillAppear: () => {
            console.log("BindContentCover onWillAppear.")
          },
          onAppear: () => {
            console.log("BindContentCover onAppear.")
          },
          onWillDisappear: () => {
            console.log("BindContentCover onWillDisappear.")
          },
          onDisappear: () => {
            console.log("BindContentCover onDisappear.")
          }
        })
    }
    .width ('100%')
    .height ('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor("#ff49c8ab")

  }
}