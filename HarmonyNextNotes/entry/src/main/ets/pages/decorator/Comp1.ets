import Comp2 from './Comp2'

@Component
export default struct Comp1 {
  // @Consume("count") count22:number
  build() {
    Column(){
      Text("Comp1子组件")
        .fontSize(30)
        .fontColor(Color.Red)
      // Text(this.count22+":Comp1子组件,,
      // Text("改变Comp1的值给父组件")
      //   .onClick(()=>{
      //     this.count22 = 0
      //   })
      Comp2()
    }
  }
}