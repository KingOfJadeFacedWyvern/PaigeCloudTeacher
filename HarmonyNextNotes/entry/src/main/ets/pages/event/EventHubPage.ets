import { common } from '@kit.AbilityKit'

@Entry
@Component
struct EventHubPage {
  context=getContext(this) as common.UIAbilityContext
  build () {
    Column () {
      Button ('给订阅者发送消息').onClick ((event: ClickEvent) => {
        this.context.eventHub.emit('myEvent', '我发了一个消息')
      })
    }
  }
}