import axios , { AxiosResponse , InternalAxiosRequestConfig } from '@ohos/axios'
import { User } from './HttpPage'
// 网络请求第三方库Axios
@Entry
@Component
struct AxiosPage {
  Address: string = "https://jsonplaceholder.typicode.com/posts"

  requestData () {
    /*
     * 1.参数，响应数据类型
     * 2.AxiosResponse，响应体的类型，请求参数
     *　　　　　　　　　　　　　　　　　AxiosResponse，响应体的data类型
     * 3.请求参数的数据，get,post,put,delete传参数的类型，如果说没有传参数的类型直接给Null就行了
     * */
    axios.get<User[] , AxiosResponse<User[]> , null> (this.Address)
      .then ((response: AxiosResponse<User[]>) => {//response返回响应体
        console.log (JSON.stringify (response.data))
      })
    //请求拦截器，请求之前拦截相关处理
    axios.interceptors.request.use ((config: InternalAxiosRequestConfig) => {
      return config
    })
    //响应拦截器，请求之后拦截相关处理
    axios.interceptors.response.use ((response: AxiosResponse) => {
      return response
    })
  }

  build () {
    Column () {
      Button ("获取数据").onClick ((event: ClickEvent) => {
        this.requestData()
      })
    }
  }
}