import Comp1 from './Comp1'
import { Model } from './PropPage'

@Component
export default struct LinkComp {
  //Link用途？父组件给子组件传递数据使用，并且呢带有响应式，子组件也可以给父组件传递数据使用，双向数据绑定
  //父组件改变值，子组件通过Link装饰器接收也可以动态的UI更新，子组件改变值，父组件也可以动态更新UI
  //Link定义1. @Link count:number = 1,类型必须有，无法初始化
  // @Link
  //1. 定义的变量方式：@Link  变量名：变量类型，变量类型必须存在,初始化值不能初始化
  // 2. @Link修饰的变量是私有的，private ，在外部无法访问到，只能在当前页面里面访问
  //   @Link不能放到@Entry页面下
  //3. @Link支持的类型有哪些？Object、class、string、number、boolean、enum类型，以及这些类型的数组Array<Object> Array<number>
  //4. Date类型
  //5. 联合类型
  //6.Map Set类型
  //7.any,不支持
  //8. 父组件给子组件传值可以用this也可以用$
  //嵌套多级对象时不支持UI刷新，无法检测到,属性，监听深度对象的属性值改变
  @Link count:number
  @Link str:string
  @Link model:Model
  @Link arrModel:Array<Model>
  //执行过程：
  /**
   * 1. 初始渲染，执行父组件build函数将创建我们的子组件实例，将数据源传给我们的子组件
      2. 初始化子组件@Prop装饰器
   3、 子组件@Prop更新时，更新仅仅停留在当前的页面
   4. 当我们父组件数据源更新时，子组件将会被父组件的数据源重置
   5. @Prop装饰本地修改会被父组件更新覆盖
   * */
  build() {
    Column(){
      Text("这是一个组件")
        .fontSize(32)
        .fontColor(Color.Red)
      Text(this.count+"子组件")
        .onClick(()=>{
          this.count  = 0
        })
      Text("model"+this.model.value)
      Repeat<Model>(this.arrModel)
        .each((obj:RepeatItem<Model>)=>{
          Text(obj.item.value)
            .onClick(()=>{
              this.arrModel[obj.index as number] = new Model("子组件改的数组Model")
            })
        })
    }
  }
}