@Entry
@Component
struct TextInputExample {
  controller: TextInputController = new TextInputController ()
  @State inputValue: string = ''
  @Builder customKeyBoard () {
    Column () {
      Button('关闭')
        .onClick(()=>{
          // 关闭自定义软键盘的作用
          this.controller.stopEditing()
        })
      Grid(){
        ForEach ([1,2,3,4,5,6,7,8,9,'*',0,'#'] , (item: number|string ) => {
          GridItem(){
            Button(item+'')
              .width(100)
             .onClick(() => {
               this.inputValue += item
             })
          }
        } , (item: string) => item)
      }
      // 显示3行
      .maxCount(3)
      // 列间距
      .columnsGap(10)
      // 行间距
      .rowsGap(10)
      .padding(10)

    }.backgroundColor (Color.Pink)
  }
  build () {
    Column () {
      TextInput({controller:this.controller,text:this.inputValue})
        // 自定义软键盘
        .customKeyboard(this.customKeyBoard())
    }

  }
}