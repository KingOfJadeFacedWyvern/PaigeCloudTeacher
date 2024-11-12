@Entry
@Component
struct NewFilePage {
  @State message: string = '新建的文件';

  build () {
    RelativeContainer () {
      Text (this.message)
        .id ('NewFilePageHelloWorld')
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