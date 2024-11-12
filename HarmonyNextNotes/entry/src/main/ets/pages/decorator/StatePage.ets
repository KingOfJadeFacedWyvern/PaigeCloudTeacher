@Entry
@Component
struct StatePage {
  //State装饰器是干什么的？State装饰器其实是用来修饰变量的，也可以称为状态变量
  //特点？一旦有了状态属性，就可以触发咱们页面UI组件的刷新，当改变状态的时候，UI会发生对应的改变
  // @State
  //1. 定义的变量方式：@State  变量名：变量类型 = 初始化值，变量类型和初始化值必须存在
  //2. @State修饰的变量是私有的，private ，在外部无法访问到，只能在当前页面里面访问
  //3. @State支持的类型有哪些？Object、class、string、number、boolean、enum类型，以及这些类型的数组Array<Object> Array<number>
  //4. Date类型
  //5. 联合类型
  //6.Map Set类型
  @State count:number = 12
  @State model:Model = new Model("我是Model")
  @State typeModel:TypeModel = TypeModel.OPEN
  @State arrModel:Array<Model> = [new Model("第一个Model"),new Model("第二个Model")]
  @State date:Date = new Date('2024-6-24')
  @State str:string|undefined = "str"
  //嵌套多级对象时不支持UI刷新，无法检测到,属性，监听深度对象的属性值改变
  @State model2:Model2 = new Model2("我是Model",new ClassA("123"))
  //嵌套多级对象时不支持UI刷新，无法检测到，属性，监听深度对象的属性值改变
  @State arrModel2:Array<Model2> = [new Model2("第一个Model",new ClassA("123")),new Model2("第二个Model",new ClassA("123"))]

  @State viewModel:ViewModel = new ViewModel()

  @State message:Map<number,string> = new Map([[0,"第一个"],[1,"第一个"],[2,"第一个"]])
  @State sets:Set<string> = new Set(["0","1","2","1"])

  //使用方式是通过this.的方式调用状态变量
  build() {
      Column(){
        //框架执行的过程：1. 当状态变量改变时，查询依赖改状态变量的组件
        //2. 执行依赖改状态变量的更新方法，组件更新渲染
        //3. 和改状态变量不相关的组件，不会发生重新渲染，页面渲染按需更新
        Text(){
          Span("123")
            .fontColor(Color.Red)
          Span("789")
            .fontSize(30)
        }.fontSize(18)
        Text(this.count+"")
          .onClick(()=>{
            this.count = 300
          })
        Text("class或者Object")
          .fontSize(20)
          .fontColor(Color.Red)
        Text(this.model.value)
          .onClick(()=>{
            this.model.value = "改变了ModelValue"
          })
        Text("enum枚举改变")
          .fontSize(20)
          .fontColor(Color.Red)
        Text(this.typeModel.toString())
          .onClick(()=>{
            this.typeModel = TypeModel.CLOSE
          })
        Text("数组类型Class改变")
          .fontSize(20)
          .fontColor(Color.Red)
        Repeat<Model>(this.arrModel)
          .each((obj:RepeatItem<Model>)=>{
            Text(obj.item.value)
              .onClick(()=>{
                obj.item.value = "试一试Arr改变"
              })
          })

        Text("Date类型改变")
          .fontSize(20)
          .fontColor(Color.Red)
        Text(this.date.toString())
          .onClick(()=>{
            // this.date = new Date("2021-6-24")
            this.date.setDate(this.date.getDate()+1);
            this.date.setFullYear(this.date.getFullYear()+1);
            this.date.setMonth(this.date.getMonth()+1);
          })

        Text("String类型的联合类型")
          .fontSize(20)
          .fontColor(Color.Red)
        Text(this.str)
          .onClick(()=>{
            this.str = undefined
          })

        Text("嵌套class类型")
          .fontSize(20)
          .fontColor(Color.Red)
        Text(this.model2.classA.title)
          .onClick(()=>{
            // this.model2.classA = new ClassA("456")
            this.model2.classA.title = "嵌套classA"
          })
        Text("数组类型ClassA2改变")
          .fontSize(20)
          .fontColor(Color.Red)
        Repeat<Model2>(this.arrModel2)
          .each((obj:RepeatItem<Model2>)=>{
            Text(obj.item.classA.title)
              .onClick(()=>{
                // obj.item.classA = new ClassA("改变classA")
                obj.item.classA.title = "改变classA"
                console.log(JSON.stringify(this.arrModel2))
              })
          })

        Text("改变箭头函数中的值")
          .fontSize(20)
          .fontColor(Color.Red)
        Text(this.viewModel.url)
          .onClick(()=>{
            // this.model2.classA = new ClassA("456")
            let self = this.viewModel
            this.viewModel.change(self)
          })

        Text("Map的值")
          .fontSize(20)
          .fontColor(Color.Red)
        //Array.from(this.message.entries()转成了数组格式的[[0,"第一个"],[1,"第一个"],[2,"第一个"]]
        //item:[number,string]=>[0,"第一个"],[1,"第一个"],[2,"第一个"]
        ForEach(Array.from(this.message.entries()),(item:[number,string])=>{
          Text(`${item[1]}`)
            .onClick(()=>{
              // this.model2.classA = new ClassA("456")
              // let self = this.viewModel
              // this.viewModel.change(self)
              this.message.set(4,"item4")
              this.message.set(0,"item1")
              this.message.delete(0)
              // this.message = new Map([[0,"12312"]])
            })
        })

        Text("Set的值")
          .fontSize(20)
          .fontColor(Color.Red)
        ForEach(Array.from(this.sets.entries()),(item:[number,string])=>{
          Text(`${item[0]}`)
            .onClick(()=>{
              this.sets.add("5")
              this.sets.delete("0")
              // this.sets = new Set(["0","12312"])
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
class Model{
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