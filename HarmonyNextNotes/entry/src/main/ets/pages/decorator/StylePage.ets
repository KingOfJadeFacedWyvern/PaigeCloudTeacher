import { MyButtonModifier } from './MyButtonModifier'

@Entry
@Component
struct StylePage {
  //@Styles只支持通用的属性和通用的事件
  //@Styles不支持传参
  @Styles
  fontStyle() {
    .width(100)
    .height(100)
  }

  @State modifier: MyButtonModifier = new MyButtonModifier(1)

  build() {
    Column() {
      Text("文本内容")
        .NewFancy()
        .fontColor(Color.White)
        .fontSize(16)
      Text("文本内容2")
        .newLocalFancy()
        .fontColor(Color.White)
        .fontSize(16)
      Text("文本内容3")
        .newLocalFancy()
        .fontColor(Color.White)
        .fontSize(16)
      Button("按钮")
        .attributeModifier(this.modifier)
    }
  }

  @Styles
  newLocalFancy() {
    .height(100)
    .width(200)
    .backgroundColor(Color.Red)
  }
}

@Styles
function NewFancy() {
  .height(100)
  .width(200)
  .backgroundColor(Color.Red)
}