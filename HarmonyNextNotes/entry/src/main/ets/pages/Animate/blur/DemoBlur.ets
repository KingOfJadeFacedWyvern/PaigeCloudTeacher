import { curves } from '@kit.ArkUI'

@Entry
@Component
struct DemoBlur {
  @State blurRadius: number = 0
  @State widthSize: number = 400
  @State heightSize: number = 320
  @State motionBlurRadius: number = 0
  @State x: number = 0
  @State y: number = 0
  @State flag: boolean = false

  build () {
    Column () {
      Image ($r ('app.media.Ocean'))
        .width (this.widthSize)
        .height (this.heightSize)
        .blur (this.blurRadius)//设置模糊半径
        .motionBlur ({
          radius: this.motionBlurRadius ,
          anchor: { x: this.x , y: this.y } ,
        })
        .onTouch ((touchEvent: TouchEvent) => {
          if (touchEvent) {
            if (touchEvent.type == TouchType.Move) {
              let y = touchEvent.touches[0].y
              if (y > 0 && y < 320) {
                this.blurRadius = y / 10
              }
            }
          }
        })
        .onClick (() => {
          this.motionBlurRadius
          this.x = 10
          this.y = 10
          if (this.flag) {
            this.widthSize=100
            this.heightSize=80
          } else {
            this.widthSize=400
            this.heightSize=320
          }

          this.flag=!this.flag
        })
        .animation({
          duration: 1000 ,
          curve:curves.springCurve(10,1,288,30),
          onFinish:()=>{
            this.motionBlurRadius=0
          }
        })


    }
    // .backgroundColor (Color.Black)
  }
}