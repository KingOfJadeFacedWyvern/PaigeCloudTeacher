import { curves } from '@kit.ArkUI'

@Entry
@Component
struct DemoAnimationConnection {
  @State positionObj: Position = { x: 10 , y: 10 }
  @State oldPositionX: number = 0
  @State oldPositionY: number = 0

  build () {
    Column () {
      Row () {
        //绘制圆
        Circle ({ width: 100 , height: 100 })
          .fill (Color.Orange)
          .position (this.positionObj)
          .onTouch ((event: TouchEvent) => {
            if (event) {
              if (event.type === TouchType.Down) {
                // this.oldPositionX = event.touches[0].windowX;
                // this.oldPositionY = event.touches[0].windowY;
                // 元素本身X和Y的距离　↓
                this.oldPositionX = event.touches[0].x;
                this.oldPositionY = event.touches[0].y;
                // 元素本身X和Y的距离　↑
              }
              if (event.type === TouchType.Move) {
                animateTo ({ curve: curves.responsiveSpringMotion() } , () => {
                  this.positionObj.x = event.touches[0].windowX-this.oldPositionX;
                  this.positionObj.y = event.touches[0].windowY-this.oldPositionY;
                })
              }
              if (event.type == TouchType.Up) {
                animateTo ({ curve: curves.springMotion() } , () => {
                  this.positionObj.x = 10
                  this.positionObj.y = 10
                })
              }
            }
          })
      }
      .width ('100%')
      .height ('100%')

    }
    .width ('100%')
    .height ('80%')
    .backgroundColor (Color.Pink)
    .clip (true)

  }
}