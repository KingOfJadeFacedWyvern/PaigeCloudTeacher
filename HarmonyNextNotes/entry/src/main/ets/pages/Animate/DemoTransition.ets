import { curves } from '@kit.ArkUI'

@Entry
@Component
struct DemoTransition {
  // TransitionEffect.OPACITY：默认的透明转场，SLIDE：平滑移动，IDENTITY：禁止转场，SLIDE_SWITCH：滑动切换
  private effect:TransitionEffect = TransitionEffect.OPACITY
    .animation({curve: curves.springMotion ()})
    .combine(TransitionEffect.rotate({angle: 120}))//增加一个动画效果
    .combine(TransitionEffect.scale({x: 20, y: 20}))//增加一个动画效果

  @State show: boolean = false
  build () {
    Column () {
      if (this.show){
        Text('玉面飞龙之王')
          .transition(this.effect)
          .fontSize(35)


      }
      Button ('点击转场').onClick(() => {
        // animateTo({curve: curves.springMotion ()},()=>{
          this.show = !this.show
        // })
      })

    }
    .width ('100%')
    .height ('100%')
    .justifyContent(FlexAlign.Center)
  }
}