import { emitter } from '@kit.BasicServicesKit'

@Entry
@Component
struct DemoParticle {
  @State emitterProp: Array<EmitterProperty> = [
    {
      index: 0 ,
      emitRate:100 ,
      position: {x:55, y:55},
      size: {width: 255, height: 255}
    }
  ]

  build () {
    Stack () {
      Text ('玉面飞龙之王')
        .fontColor (Color.White)

       Particle ({
               particles: [
                 {
                   emitter: {
                     particle: {
                       type: ParticleType.POINT , //粒子类型
                       config: {
                         radius: 5 //圆点半径
                       } ,
                       count: 100 , //粒子总数
                     } ,
                   } ,
                   color: {
                     range: [Color.Blue, Color.Red]
                   }
                 },
               ]
             }).width (255).height (255)
               // .emitter(this.emitterProp)




    }
    .width ('100%')
    .height ('100%')
    .backgroundColor (Color.Black)

  }
}