import PeiqiClass, { ClassPeiQiA, ObjItem, ObjItemArray } from './ObservedPage'

@Component
export default struct ObservedComp1 {
  //只能是类的实例，不支持基本类型
  @ObjectLink objItemArr:ObjItemArray
  //@ObjectLink需要改那个对象实例，就把那个对象实例传过来
  @ObjectLink classPeiQiA:ClassPeiQiA
  build() {
    Column(){
      Text("ObservedComp1自定义组件")
        .fontSize(30)
        .fontColor(Color.Red)
      Button("修改数组对象中的属性")
        .onClick(()=>{

          this.objItemArr[0].title ="修改了第一个"
          this.objItemArr.splice(0,0,new ObjItem("修改了第一个了啊哈"))
        })
      Text(this.classPeiQiA.value)
      Button("修改嵌套对象中的属性")
        .onClick(()=>{
          this.classPeiQiA.value="123456"
          // this.peiqiClass.classPeiQiA = new ClassPeiQiA("123456")
        })
    }
  }
}