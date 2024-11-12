import ObservedComp1 from './ObservedComp1'

@Entry
@Component
struct ObservedPage {
  @State arrObjItem:ObjItemArray = [new ObjItem("第一个Model"),new ObjItem("第二个Model")]
  @State peiqiClass:PeiqiClass = new PeiqiClass("peiqi",new ClassPeiQiA("150000000"))
  @State classA:ClassPeiQiA = new ClassPeiQiA("123")
  /**
   *
   * 1. @Observed装饰的类可以被观察到，多层属性
   * 2. 子组件中@ObjectLink装饰器装饰的变量用于接受
   * @Observed装饰类的实例，和父组件中对应的状态遍历那个进行双向数据绑定
   * @Observed用于嵌套类场景，观察对象类属性的变化，要配合自定义组件一起用
    注意：ObjectLink装饰器不能再@Entry下使用
   @ObjectLink：支持的类型必须被@Observed装饰的class实例，必须指定类型，不能指定初始化值
    不支持简单类型！
   可以通过继承Date，Array来实现class实例，MapSet的示例，联合类型也支持
   ObjectLink修饰class，是只读的，不能更改变量this.objItemArr = new ObjItemArray()
   * */
  /**
   * 渲染：
   * 1. @Observed装饰的class实例会被不透明的代理对象包装，代理了class上面的setter,getter方法
    2.子组件@ObjectLink装饰的从父组件初始化，接受被@Observed装饰的class实例
   3. @ObjectLink包装类将会自己注册给@Observed class
   4.属性的更新：当@Observed class属性发生改变时，会走代理set和get方法，然后呢遍历依赖他的@ObjectLink包装类，通知数据更新
   */
  build() {
    Column(){
      Text("Observed页面")
      Text(this.arrObjItem[0].title)
      Text("ObservedFor循环打印")
      Repeat<ObjItem>(this.arrObjItem)
        .each((obj:RepeatItem<ObjItem>)=>{
          Text(obj.item.title)
        })


      Text("Observed页面修改嵌套对象")
      // ObservedComp1({objItemArr:this.arrObjItem,peiqiClass:this.peiqiClass})
      ObservedComp1({objItemArr:this.arrObjItem,classPeiQiA:this.peiqiClass.classPeiQiA})
      Button("点击classA的值"+this.classA.value)
        .onClick(()=>{
          this.classA.value = "点击后的值"
        })
    }
  }
}
@Observed
export class ObjItemArray extends Array<ObjItem>{

}
@Observed
export class ObjItem{
  title:string

  constructor(title:string) {
    this.title =title
  }
}
@Observed
export default class PeiqiClass{
  title:string
  classPeiQiA:ClassPeiQiA
  constructor(title:string,classPeiQiA:ClassPeiQiA) {
    this.title =title
    this.classPeiQiA = classPeiQiA
  }
}
@Observed
export  class ClassPeiQiA{
  value:string
  constructor(value:string) {
    this.value =value
  }
}