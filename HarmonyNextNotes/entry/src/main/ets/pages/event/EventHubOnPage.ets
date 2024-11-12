import { common } from '@kit.AbilityKit'
import { router } from '@kit.ArkUI'
// EventHubOnPage和EventHubPage页面通信
// 当页面不会自动刷新，或者重新刷新的时候可以通过eventhub事件订阅的方式进行数据更新
@Entry
@Component
struct EventHubOnPage {
  context=getContext(this) as common.UIAbilityContext

  aboutToAppear(): void {
    this.context.eventHub.on('myEvent',this.eventBack)
  }
  eventBack(title: string){
    console.log(title+'接收到值了')
  }　
  build () {
    Column () {
      Button ('跳转到发送页面').onClick ((event: ClickEvent) => {
        router.pushUrl ({
          url: "pages/event/EventHubPage"
        })
      })
    }

  }
}