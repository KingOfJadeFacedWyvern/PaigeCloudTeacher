import { router } from '@kit.ArkUI'

@Entry
@Component
struct RouterPage {
  @State paramInfo: DataModel = new DataModel ()

  onPageShow(): void {
    let params = router.getParams ()
    if (params != null) {
      let data = router.getParams () as Record<string , number>
      console.log (data['backIndex'].toString ())
    }
  }
  // aboutToAppear (): void {
  //   let params = router.getParams ()
  //   if (params != null) {
  //     let data = router.getParams () as Record<string , number>
  //     console.log (data['backIndex'].toString ())
  //   }
  //
  // }

  build () {
    Column () {
      Button ('跳转页面')
        .onClick (() => {
          router.pushUrl ({
            url: "pages/Component/router/RouterCompPage" ,
            params: this.paramInfo

          })

        })
    }
  }
}

export class DataModel {
  name: string = '龙飞'
}