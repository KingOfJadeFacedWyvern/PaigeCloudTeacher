import router from '@ohos.router';

@Entry
@Component
struct RouterOnePage {
  @State message: string = 'Hello World';

  build () {
    RelativeContainer () {
      Text (this.message)
        .id ('RouterOnePageHelloWorld')
        .fontSize (50)
        .fontWeight (FontWeight.Bold)
        .alignRules ({
          center: { anchor: '__container__' , align: VerticalAlign.Center } ,
          middle: { anchor: '__container__' , align: HorizontalAlign.Center }
        })
      Button ('返回到上一页').onClick ((event: ClickEvent) => {
        router.back()
      })

    }
    .height ('100%')
    .width ('100%')
  }
}