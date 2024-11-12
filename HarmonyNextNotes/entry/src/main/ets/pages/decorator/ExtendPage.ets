import { promptAction } from '@kit.ArkUI'
import { MyButtonModifier } from './MyButtonModifier'

@Entry
@Component
struct ExtendPage {
  @State lable: string = "123"
  @State modifier: MyButtonModifier = new MyButtonModifier(1)

  onclickHandler() {

    promptAction.showToast({ message: "弹" })
    this.lable = "456"
  }

  build() {
    Column() {
      Text("文本内容")
        .newExtend(60, Color.Blue, () => {
          this.onclickHandler()
        })
      Text("文本内容2")
        .newExtend(320, Color.Orange, () => {
          this.onclickHandler()
        })
      Text("文本内容3")
        .newExtend(120, Color.Pink,
          this.onclickHandler)
      Button("按钮")
        .attributeModifier(this.modifier)
    }
  }
}

//1.@Extend(组件名)
//2. 只能放到全局，需要用function
@Extend(Text)
function newExtend(height: number, color: Color, onclick: () => void) {
  .height(height)
  .width(200)
  .backgroundColor(color)
  .fontColor(Color.White)
  .fontSize(16)
  .onClick(onclick)
}
