import PropComp from './PropComp'

@Entry
@Component
struct PropPage {
  @State count2:number = 123
  @State model:Model = new Model("我是Model")
  @State arrModel:Array<Model> = [new Model("第一个Model"),new Model("第二个Model")]

  build() {
    Column(){
      Text("这是一个页面")
      Text(this.count2+"")
      Text("页面改变count")
        .onClick(()=>{
          this.count2 = this.count2+1
        })
      Text("页面改变model.value")
        .onClick(()=>{
          this.model.value = "123123"
        })
      Text("页面改变modelItem.value")
        .onClick(()=>{
          this.arrModel[0]=new Model("吃什么吧")
        })
      PropComp({ count:this.count2,str:"456",model:this.model })
      Repeat<Model>(this.arrModel)
        .each((obj:RepeatItem<Model>)=>{
          PropComp({ count:this.count2,str:"456",model:this.model,modelItem:obj.item })
            .onClick(()=>{
              obj.item.value="测试"
            })
        })
    }
  }
}
class ViewModel{
  url:string = '123'
  change=(model:ViewModel)=>{
    model.url = "456"
  }
}
export class Model{
  value:string
  constructor(value:string) {
    this.value = value
  }
}
class Model2{
  value:string
  classA:ClassA
  constructor(value:string,classA:ClassA) {
    this.value = value
    this.classA = classA
  }
}
class ClassA{
  title:string

  constructor(title:string) {
    this.title = title
  }
}
enum TypeModel{
  OPEN="open",
  CLOSE="close"
}