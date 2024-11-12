import router from '@ohos.router';

@Entry
@Component
struct MainPage {
  @State message: string = 'Hello World';

  build () {
    Column () {
      Text('主页面')
      Button ('跳转页面').onClick (() => {
        router.pushUrl ({
          url:  "pages/Animate/pageRouterTransition/RouterOnePage"
        })
      })
    }
    .width ('100%')
    .height ('100%')
    .backgroundColor (Color.Pink)
  }
  // 页面跳转动画
  pageTransition() {
    // 进入页面的时候触发的动画
    //跳转页面到MainPage页面的动画
    PageTransitionEnter ({
      type:RouteType.Push,duration:2000
    })
      .slide(SlideEffect.Right)
      .translate({y:1000})
      // .scale({x:10,y:10})
    // 其他页面返回到MainPage页面的动画
    PageTransitionEnter ({
      type:RouteType.Pop,duration:2000
    })
      .slide(SlideEffect.Left)
      .translate({y:1000})
      // .scale({x:10,y:10})
    // 退出页面的时候触发的动画
    PageTransitionExit ({
      type:RouteType.Push,duration:2000
    })
      .slide(SlideEffect.Right)
      .translate({y:1000})
      // .scale({x:5,y:5})
    PageTransitionExit ({
      type:RouteType.Pop,duration:2000
    })
      .slide(SlideEffect.Left)
      .translate({x:10})
      // .scale({x:5,y:5})

  }
}