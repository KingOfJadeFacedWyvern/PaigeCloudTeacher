import { webSocket } from '@kit.NetworkKit';
/*
 * WebSocket其实就是建立服务端与客户端的双向的连接(通信数据)
 *             客户端可以给服务端发送消息，也可以接收来自服务端的消息
 *             客户端与服务端要进行一个双向的连接，链接上以后才会对应的ID，服务端才知道需要往哪一个链接到服务端的用户发送消息
 *             客户端和服务端双向通讯之前需要先建立一个Connection的链接，建立链接完成以后，客户端就可以主动发送WS开头WebSocket协议数据给服务端，客户端可以主动发送很多数据给服务端。
 * 　　　　　　　当服务端接收到消息以后或者处理到消息以后或者服务端有定时循环的任务，有触发的条件以后，服务端都可以主动给客户端发送消息，服务端也可以给客户端主动发送消息，不可以不用响应，也可以用响应
 * 　　　　　　　
 * */
class WebSocketUtilities {
  //模拟器演示地址尽量用本机的ip地址

  baseIpAddress = "ws://192.168.3.5:8080";
  public ws: webSocket.WebSocket = {} as webSocket.WebSocket

  constructor (url?: string) {
    if (!url) {
      //没有值的时候
      url = this.baseIpAddress;
    }
    this.initWebSocket (url);

  }

  initWebSocket (url: string) {
    //创建客户端websocket实例
    this.ws = webSocket.createWebSocket ();
    //1. 连接客户端
    this.ws.connect (url , (error , data) => {
      if (!error) {
        console.log ('客户端连接服务端成功');

      } else {
        console.log ('客户端连接服务端失败' + error.message);
      }

    })
    //监听客户端连接　↓
    //2. 默认打开链接
    this.ws.on ('open' , (error , value) => {
      console.log ('打开连接状态' + JSON.stringify (value));
    })
    //3. 监听服务端发送过来的消息
    this.ws.on ('message' , (error , data) => {
      if (!error) {
        console.log ('收到消息' + JSON.stringify (data))
      } else {
        console.log ('收到消息失败' + error.message);
      }
    })
    //4。关闭连接
    this.ws.on ('close' , (error , value) => {
      console.log ('关闭连接状态' + JSON.stringify (value.reason));
    })
    //5. 错误处理监听
    this.ws.on ('error' , (error) => {
      console.log ('连接错误' + error.message);
    })
    //监听客户端连接　↑
  }

  async sendMessage (message: Object): Promise<boolean> {
    return await this.ws.send (JSON.stringify (message))
  }
}

export default WebSocketUtilities