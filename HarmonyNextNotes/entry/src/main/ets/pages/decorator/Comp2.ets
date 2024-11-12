@Component
export default struct Comp2 {
  @Consume("count") count:number
  build() {
    Column(){
      Text("Comp2子组件")
        .fontSize(30)
        .fontColor(Color.Red)

      Text(this.count+":Comp2子组件")
      Text("改变Comp2的值给父组件")
        .onClick(()=>{
          this.count = 222
        })
    }
  }
}