import { http } from '@kit.NetworkKit'
import { BusinessError } from '@kit.BasicServicesKit'

class HttpUtilities {
  baseUrl: string = "https://jsonplaceholder.typicode.com/"
  httpRequest: http.HttpRequest = {} as http.HttpRequest
  public static readonly CONNECT_TIME_OUT = 60000
  public static readonly READ_TIME_OUT = 60000
  public static readonly USING_PROTOCOL = http.HttpProtocol.HTTP1_1

  constructor () {
    this.init
  }

  private header: Record<string , string> = {
    "Content-Type": ContentType.JSON
  }

  init () {
    if (Object.keys (this.httpRequest).length != 0) {
      return
    } else {
      this.httpRequest = http.createHttp ()
    }
  }

  request<T> (
    path: string ,
    method: http.RequestMethod ,
    extraData?: Object ,
    parameter?: Record<string , string | number> ,
    header?: Record<string , string> ,
    urlPath?: string): Promise<T> {
    let url = urlPath||`${this.baseUrl}${path}`
    let myHeader = header || this.header
    if (parameter) {
      switch (method) {
        case http.RequestMethod.GET:
        case http.RequestMethod.DELETE: {
          let urlParams = Object.keys (parameter).map (key => `${key}=${parameter[key]}`).join ("&")
          url = url.includes ("?") ? `${url}${urlParams}` : `${url}?${urlParams}`

          // if (url.includes ("?")) {
          //   url=`${url}${urlParams}`
          // }else {
          //   url=`${url}?${urlParams}`
          // }
        }
      }
    }
    return new Promise ((resolve , reject) => {
      this.httpRequest.request (url , {
        method , //指定请求方式
        header: myHeader , //最常用的协议头 "Content-Type": "application/json"
        usingCache: true , //是否使用缓存:如果说重复请求的时候数据格式一样，不会再去重新请求
        extraData ,
        connectTimeout: HttpUtilities.CONNECT_TIME_OUT , //连接超时时间
        readTimeout: HttpUtilities.READ_TIME_OUT , //读取超时时间
        usingProtocol: HttpUtilities.USING_PROTOCOL , //协议
        // usingProxy: false , //是否使用代理
      }).then ((data: http.HttpResponse) => {
        let result: T = JSON.parse (data.result.toString ()) as T
        resolve (result)
        console.log ("data" + JSON.stringify (data))
      }).catch ((reason: BusinessError) => {
        console.log ("reason" + reason.message)
        reject (reason)
      })
    })

  }

  get<T> (path: string , parameter?: Record<string , string | number>): Promise<T> {
    return this.request<T> (path , http.RequestMethod.GET , undefined , parameter)
  }
  post<T> (path: string ,extraData?:Object): Promise<T> {
    return this.request<T> (path , http.RequestMethod.POST , extraData)
  }
  put<T> (path: string ,extraData?:Object): Promise<T> {
    return this.request<T> (path , http.RequestMethod.PUT , extraData)
  }
  delete<T> (path: string , parameter?: Record<string , string | number>): Promise<T> {
    return this.request<T> (path , http.RequestMethod.DELETE , undefined , parameter)

}
}

enum ContentType {
  JSON = "application/json" ,
  FORM = "application/x-www-form-urlencoded" ,
  TEXT = "text/plain" ,
  HTML = "text/html" ,
  XML = "application/xml" ,
  MULTIPART = "multipart/form-data" ,
  FORM_URLENCODED = "application/x-www-form-urlencoded"
}

export default new HttpUtilities ()