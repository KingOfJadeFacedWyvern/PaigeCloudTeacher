import { common } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';

@Entry
@Component
struct ImmersiveEffectPage {
  @State message: string = '玉面飞龙之王';
  bottomHeight: number = px2vp (AppStorage.get<number> ('bottomRectHeight'));
  //设置全屏的方法　↓
  context = getContext (this) as common.UIAbilityContext

  aboutToAppear (): void {
    window.getLastWindow (this.context).then ((window) => {
      window.setWindowLayoutFullScreen (true)
    })
  }

  //设置全屏的方法　↑
  build () {
    Row () {

      Column ({ space: 20 }) {
        Row () {
          Text (this.message)
            .fontSize (20)
          // .height (100)
        }
        .width ('100%')
        // .height(100)
        .backgroundColor (Color.Blue)
        // expandSafeArea:延伸到避让区域，里面的内容不占用区域
        // .expandSafeArea ([SafeAreaType.SYSTEM] , [SafeAreaEdge.TOP]) //延伸：向上延伸一部分
        Row () {
          Text (this.bottomHeight + '')
            .fontSize (20)
            .height (100)


        }
        .width ('100%')
        .height (100)
        .backgroundColor (Color.Blue)
      }
      .width ('100%')
      .height ('100%')
      .backgroundColor (Color.Pink)
      //expandSafeArea:延伸到避让区域，里面的内容不占用避让区域
      // .expandSafeArea ([SafeAreaType.SYSTEM] , [SafeAreaEdge.BOTTOM]) //延伸：底部延伸一部分

    }
    // .margin ({ bottom: this.bottomHeight})
    .backgroundColor (Color.White)

  }
}