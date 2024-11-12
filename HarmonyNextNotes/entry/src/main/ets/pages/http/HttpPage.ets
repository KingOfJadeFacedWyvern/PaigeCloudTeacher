import { http } from '@kit.NetworkKit'
import { BusinessError } from '@kit.BasicServicesKit'
import HttpUtilities from '../../common/http/HttpUtilities'
import { addPosts , getPosts } from '../../common/viewmodel/posts'
import { PostMessageOptions } from '@kit.ArkTS'

/*
 * 最常用的协议头有：HTTP、HTTPS、FTP、SMTP、POP3、IMAP、Telnet、SSH、DNS、TCP、UDP、ICMP、HTTP2、HTTP3、WebSocket等
 * 协议头　　　　　　　　　　　　　　　URL路径
 * 　↓　　　　　　　　　　　　　　　　　　↓
 * https://www.bilibili.com/video/BV1niH9eeERj/?vd_source=2f62a97ae9e402e3242483d4867222ba
 *　　　　　　　　　↑　　　　　　　　　　　　　　　　　　　　　　　　↑
 * 　　　　主机HOST就是域名的地址　　　　　　　　　　　　　　问号后面请求参数
 * 最常用发送请求的方式有：GET、POST、PUT、DELETE、HEAD、OPTIONS、TRACE、CONNECT、PATCH等
 *                     GET查询相关的操作，获取相关操作
 *                     POST创建一个资源、新增一个数据
 *                     PUT更新一个资源、修改一个数据
 *                     DELETE删除一个资源、删除一个数据
 * 比较重要Response　Header头、Request Header头
 *        Response　Header就是响应头
 *        Request Header就是请求头：
 *                                一般最重要的是包含的Content-Type
 * 　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　Content-Type代表请求内容的类型也就是说传输数据的时候
 *　只需要了解请求的时候
 * 　　　　　　　　　　　URL路径是什么
 * 　　　　　　　　　　　怎么给后端传参数
 * 　　　　　　　　　　　怎么获取后端的数据
 * 　　　　　　　　　　　怎么去渲染页面就够了　　　　　　　　
 * */
@Entry
@Component
struct HttpPage {
  httpRequest: http.HttpRequest = http.createHttp () //创建一个http请求
  @State user: User[] = new Array<User> () //存放请求的数据
  @State body: string = ''
  Address: string = "https://jsonplaceholder.typicode.com/posts"
  @State post: Post = {
    title: "foo" ,
    body: "bar" ,
    userId: 1 ,
  }

  requestData () {
    this.httpRequest.request (//请求数据
      this.Address , //指定URL地址
      //配置项
      {
        method: http.RequestMethod.GET , //指定请求方式
        header: {
          //最常用的协议头 "Content-Type": "application/json"
          "Content-Type": "application/json" ,
        } ,
        usingCache: true , //是否使用缓存:如果说重复请求的时候数据格式一样，不会再去重新请求
        connectTimeout: 60000 , //连接超时时间
        readTimeout: 60000 , //读取超时时间
        usingProtocol: http.HttpProtocol.HTTP1_1 , //协议
        usingProxy: false , //是否使用代理
      } , (error: BusinessError , data: http.HttpResponse) => { //响应回调
      if (error) {
        return
      } else {
        if (data && data.result) {
          //把请求到的数据转成对象
          this.user =
            JSON.parse (data.result.toString ()) as User[] //转换数据的时候一定要注意:需要首先转成字符串再去转成json对象再用as User才能识别到这个数据
          console.log ("data" + JSON.stringify (data.result))
        }
      }


    }

    )
  }

  build () {
    Column () {
      Button ("请求数据").onClick (async () => {
        // this.requestData ()
        let result = await getPosts ()
        this.user = result
        console.log (JSON.stringify (result))
      })

      Button ("新增数据").onClick (async () => {
        // this.requestData ()
        let result = await addPosts (this.post)
        this.body = result.body
        console.log ('添加成功后数据' + JSON.stringify (result))
      })
      Text (this.body)

      List () {
        ForEach (this.user , (user: User) => {
          ListItem () {
            Column () {
              Text (user.userId.toString ())
              Text (user.id.toString ())
              Text (user.title)
              Text (user.body)
            }

          }
        })
      }
    }
  }
}

interface Post {
  title: string,

  body: string,

  userId: number
}

export interface User {
  userId: number,

  id: number,

  title: string,

  body: string
}