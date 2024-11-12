@Entry
@Component
struct OldPage {
  @State message: string = '已经保存的文件';

  build () {　
    RelativeContainer () {
      Text (this.message)
        .id ('OldPageHelloWorld')
        .fontSize (50)
        .fontWeight (FontWeight.Bold)
        .alignRules ({
          center: { anchor: '__container__' , align: VerticalAlign.Center } ,
          middle: { anchor: '__container__' , align: HorizontalAlign.Center }
        })
    }
    .height ('100%')
    .width ('100%')
  }
}