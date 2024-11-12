@Entry
@ComponentV2
struct BuilderParamPage {
  @Builder
  info() {
    Text("123123")
  }

  @Builder
  userInfo() {
    Row() {
      Column() {
        Image($r("app.media.app_icon"))
          .width(32)
          .borderRadius(50)
        Text("王力宏")
      }

      Column() {
        Button("点赞")
          .onClick(() => {
          })
      }
    }.width("100%")
    .justifyContent(FlexAlign.SpaceBetween)
  }

  build() {
    Column() {
      //1. 通过传参形式
      Card({ info: this.info, info2: this.info })
      //2. 尾随闭包形式,有且只有一个@BuilderParam
      // Card() {
      //   Row() {
      //     Column() {
      //       Image($r("app.media.wanglihong"))
      //         .width(32)
      //         .borderRadius(50)
      //       Text("王力宏")
      //     }
      //
      //     Column() {
      //       Button("点赞")
      //         .onClick(() => {
      //         })
      //     }
      //   }.width("100%")
      //   .justifyContent(FlexAlign.SpaceBetween)
      // }

    }.padding(10)
  }
}

@Component
struct Card {
  @Builder
  defaultInfo() {
  }

  @Builder
  defaultInfo2() {
  }

  @BuilderParam info: () => void = this.defaultInfo
  @BuilderParam info2: () => void = this.defaultInfo2

  build() {
    Column() {
      //slot
      this.info()
      Row() {
        this.info2()
      }.width(100)
      .backgroundColor(Color.Red)
    }
    .width("100%")
    .height(200)
    .borderRadius(10)
    .shadow({ radius: 10, color: Color.Pink })
  }
}