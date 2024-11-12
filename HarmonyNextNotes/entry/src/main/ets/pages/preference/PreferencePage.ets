import { preferencesUtil } from './PreferencesUtil'

@Entry
@Component
struct PreferencePage {
  @State username:string =""
  aboutToAppear(): void {

  }
  build() {
    Column(){
      Button("添加数据")
        .onClick(()=>{
          preferencesUtil.put("user",new User("佩奇","123456"))

        })
      Button("查询数据")
        .onClick(()=>{
          if(preferencesUtil.get("user")){
            let user =preferencesUtil.get("user") as User
            this.username = user.username
          }else{
            this.username = ""
          }
        })
      Button("删除数据")
        .onClick(()=>{
          preferencesUtil.delete('user')
        })
      Text("用户名："+this.username)
    }
  }
}
class User{
  username:string
  password:string

  constructor(username:string,
    password:string) {
    this.username= username
    this.password = password
  }
}