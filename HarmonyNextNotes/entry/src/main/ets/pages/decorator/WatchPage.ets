@Entry
@Component
struct WatchPage {
  @State @Watch("changeCount") count:number = 0
  //@Watch("changeCount")定义监听状态改变，小括号里面需要和外部方法名称保持一致
  @State str:string ="123"
  @State @Watch("changeTitle") info:Info= new Info()
  changeCount(){
    this.str = "count变化了"+this.count
  }
  changeTitle(){
    this.str = "title变化了"+this.info.title
  }
  build() {
    Column(){
      Text(this.str)
      Button("改变Count"+this.count)
        .onClick(()=>{
          this.count=this.count+1
          this.info.value = "佩奇变化了"
        })
    }
  }
}
class Info{
  title:string = "佩奇"
  value:string = "123"
}