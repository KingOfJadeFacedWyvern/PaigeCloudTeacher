import { webSocket } from '@kit.NetworkKit'

class WebSocketUtil{
  //模拟器演示地址尽量用本机的ip地址
  baseIpAddress = "ws://192.168.3.5:8080"
  public ws:webSocket.WebSocket = {} as webSocket.WebSocket

  constructor(url?:string) {
    if(!url){
      //没有值的时候
      url = this.baseIpAddress
    }
    this.initWebSocket(url)
  }
  initWebSocket(url:string){
    //创建客户端websocket实例
    this.ws = webSocket.createWebSocket()
    //1. 连接客户端
    this.ws.connect(url,(err,data)=>{
      if(!err){
        console.log("客户端连接服务端成功!")
      }else{
        console.log("连接失败："+err.message)
      }
    })
    //2. 默认打开链接
    this.ws.on("open",(err,value)=>{
      console.log("打开链接状态："+JSON.stringify(value))
    })
    //3. 监听服务端发送过来的消息
    this.ws.on("message",(err,data)=>{
      if(!err){
        console.log("收到服务端的消息"+JSON.stringify(data))
      }else{
        console.log("收到服务端的消息失败"+err.message)
      }
    })
    //4。关闭连接
    this.ws.on('close',(err,value)=>{
      console.log("关闭链接状态："+JSON.stringify(value.reason))
    })
    //5. 错误处理监听
    this.ws.on('error',(err)=>{
      console.log("错误："+err.message)
    })
  }
  async sendMessage(message:Object):Promise<boolean>{
    return await this.ws.send(JSON.stringify(message))
  }
}
export default WebSocketUtil