import {  router } from '@kit.ArkUI';
import { DataModel } from './RouterPage';

@Entry
@Component
struct RouterCompPage {
  @State message: string = '玉面飞龙之王';
  aboutToAppear(): void {
   // let data = router.getParams()
   //  console.log (JSON.stringify(data))
   // let data = router.getParams() as Record<string,number>
   //  console.log (data['name'].toString())
   let data = router.getParams() as DataModel
    console.log (data.name)
  }

  build () {
    RelativeContainer () {
      Text (this.message)
        .id ('RouterCompPageHelloWorld')
        .fontSize (50)
        .fontWeight (FontWeight.Bold)
        .alignRules ({
          center: { anchor: '__container__' , align: VerticalAlign.Center } ,
          middle: { anchor: '__container__' , align: HorizontalAlign.Center }
        })
       .onClick(() => {
           router.back({
             url: "pages/Component/router/RouterPage",
             params: {
               backIndex: 1,
             }
           })
       })
    }
    .height ('100%')
    .width ('100%')
  }
}