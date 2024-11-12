import { bundleManager , common } from '@kit.AbilityKit'
import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct OpenLinkDemo {
  context=getContext(this) as common.UIAbilityContext
  build () {
    Column () {
      Button ('转换浏览器').onClick (() => {
        // DeepLink打开方式，用的不是太多，这种方式打开其实还是不是很安全，这种方式其实和隐式的是一样的，其实也是隐式的跳转。要打开浏览器可以这种方式、简单、易用　↓
        // 官方推荐AppLink
        let url = 'https://www.baidu.com'//打开链接叫DeepLink
         try {
          // 效验这个url是否能打开,效验之前需要注册https，需要配置module.json5下面module增加一个“querySchemes”:[{"https"}]
          let canOpenLink =bundleManager.canOpenLink(url)
           if (canOpenLink) {
             this.context.openLink(url)// 打开链接叫DeepLink并且拉直第三方应用
           }
           console.log (JSON.stringify(canOpenLink))

        } catch (error) {
          let message=(error as BusinessError).message
           console.log ('message:' + message)

        }
      //   DeepLink打开方式，用的不是太多，这种方式打开其实还是不是很安全，这种方式其实和隐式的是一样的，其实也是隐式的跳转。要打开浏览器可以这种方式、简单、易用　↑
      })
    }
  }
}