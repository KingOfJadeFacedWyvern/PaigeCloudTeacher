import { CustomTheme , ThemeControl  } from '@kit.ArkUI'
import { appTheme } from './AppTheme'
//应用级的主题皮肤设置
// ThemeControl.setDefaultTheme(appTheme)
@Entry
@Component
struct CustomThemePage {

  @State customTheme: CustomTheme = appTheme
  build () {
    Column () {
      //WithTheme: 设置局部的主题，这种方式更加灵活一些
      WithTheme({theme: this.customTheme }){

        Toggle({type:ToggleType.Switch,isOn:true})
          .margin ({ top: '16fp'})
          .alignSelf(ItemAlign.Center)


      }
      Slider({value:50,max:100})



    }
  }
}