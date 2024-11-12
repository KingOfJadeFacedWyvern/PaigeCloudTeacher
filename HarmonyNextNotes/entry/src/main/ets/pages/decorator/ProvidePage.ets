import Comp1 from './Comp1'
import Comp2 from './Comp2'

@Entry
@Component
struct ProvidePage {
  //@Provide就相当于变量的提供者
  //Consume就相当于变量的接受者
  //他们有一个特点，可以跨组件传递

  //Provide用途？父组件给所有后置子组件传递数据使用，并且呢带有响应式，子组件也可以给父组件传递数据使用，双向数据绑定
  //父组件改变值，子组件通过Provide Consume装饰器接收也可以动态的UI更新，子组件改变值，父组件也可以动态更新UI
  //Provide定义1. @Provide count:number = 1,类型必须有，必须有，和@State
  //Consume定义1. @Consume("Provide的变量名") count:number = 1,Provide的变量名（一定和Provide修饰的变量一致）类型必须有，必须有，初始值不可以有和@Link一致
  // @Provide
  //1. 定义的变量方式：@Provide  变量名：变量类型，变量类型必须存在,初始化值必须
  // 2. @Provide修饰的变量是私有的，private ，在外部无法访问到，只能在当前页面里面访问
  //   @Provide在@Entry页面下
    // @Consume不能在@Entry页面下
  //3. @Provide支持的类型有哪些？Object、class、string、number、boolean、enum类型，以及这些类型的数组Array<Object> Array<number>
  //4. Date类型
  //5. 联合类型
  //6.Map Set类型
  //7.any,不支持
  //8. 父组件给子组件传值无法使用this单独传参数，不需要单独传递
  //嵌套多级对象时不支持UI刷新，无法检测到,属性，监听深度对象的属性值改变
  @Provide count:number = 0
  build() {
    Column(){
      Text("父组件")
        .fontSize(30)
        .fontColor(Color.Red)
      Text("父组件的Count"+this.count)
      Text("改变count")
        .onClick(()=>{
            this.count = this.count+1
        })
      Comp1()
    }
  }
}