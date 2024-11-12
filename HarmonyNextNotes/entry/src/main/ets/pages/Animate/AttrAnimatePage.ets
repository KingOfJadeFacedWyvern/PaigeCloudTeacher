// import curves from '@ohos.curves'
import { curves } from '@kit.ArkUI'

/*
 * 1. 属性动画。放到操作属性的上面就叫属性动画：
 *            尺寸属性、布局属性（位置，大小，内外边距），位置属性、背景颜色、背景颜色、外观（透明度圆角）等等很多的类型
 *            只要引起UI样式变化的属性，那么就可以使用属性动画。
 * enabled：显示禁用状态，交互状态禁用还是开启的时候，不会引起UI变化
 * focusable：获取焦点的时候，直接响应用户行为，不需要加入UI动画效果*/

@Entry
@Component
struct AttrAnimatePage {
  @State rotateValue: number = 0
  @State translateValue: number = 0
  @State animate: boolean = false

  build () {
    Row () {
      Column () {

      }
      .backgroundColor (Color.Pink)
      .width (100)
      .height (100)
      .borderRadius (10)
      .rotate ({ angle: this.rotateValue })
      .onClick (() => {
        animateTo ({
          /*
           * 1.对象。动画的参数：
           *                  duration：动画持续的时间ms，用得很多
           *                  tempo：动画的播放速度，
           *                  curve：动画曲线、阻尼的动画：curves.springMotion需要引入import curves from '@ohos.curves'　用得很多
           *                  delay：动画延迟时间，
           *                  iterations：动画循环次数，
           *                  playMode：动画播放模式：
           *                                      Reverse反向播放,
           *                                      Alternate奇数词正向播放(1 3 5 7 9)、偶数次反向播放(2 4 6 8),
           *                                      AlternateReverse奇数词反向播放(2　4　6　8)、偶数次反向播放(1　3　5　7　9)
           * 2.为动画的闭包函数，
           * 　*/
          duration: 1000 ,
          tempo: 0.1 ,
          curve: curves.springMotion () ,
          // delay:100,
          iterations: 1 ,
          playMode: PlayMode.Normal ,
        } , () => {
          this.animate = !this.animate
          this.rotateValue = this.animate ? 90 : 0
          this.translateValue = this.animate ? 90 : 0
        })
      })

      Column () {

      }
      .backgroundColor (Color.Blue)
      .width (100)
      .height (100)
      .borderRadius (10)
      .translate ({ x: this.translateValue })
      .opacity (0.6)
    }
    .width ('100%')
    .height ('100%')
  }
}
