import WebSocketUtilities from '../../common/websocket/WebSocketUtilities'

@Entry
@Component
struct WebSocketPage {
private webSocket:WebSocketUtilities= new WebSocketUtilities();
  build () {
    Column () {
      Button ('发送信息').onClick ((event: ClickEvent) => {
        this.webSocket.sendMessage('hello world')

      })
    }
  }
}