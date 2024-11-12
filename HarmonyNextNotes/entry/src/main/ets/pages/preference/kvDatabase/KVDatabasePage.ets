import { kvDatabase } from './KVDatabase'

@Entry
@Component
struct KVDatabasePage {
  @State userName: string = ''
  build () {
    Column () {
      Button("添加数据")
        .onClick(()=>{
          kvDatabase.put("user","1024")

        })
      Button("查询数据")
         .onClick(async ()=>{
         let userName=await kvDatabase.get("user") as string
        this.userName = userName?userName:""
        })
      Button("删除数据")
        .onClick(()=>{
          kvDatabase.delete('user')
        })
      Text("用户名："+this.userName)
    }
  }
}