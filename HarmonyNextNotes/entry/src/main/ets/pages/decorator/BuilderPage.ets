import globalBuilder from './CommonPage'

@Entry
@Component
struct BuilderPage {
  @State label: string = "王力宏"
  @State personTitle: string = "222"

  //自定义构建函数,我们通用的或者复杂的ui描述提取出来，进行复用
  //内部定义
  //值传递，引用传递
  //值传递：不会影响原来的变量，相当于给他传值的时候给他一个副本，不会触发ui更新
  //let temp = "a",let title =temp，string，number，undefined，boolean
  //引用传递：class，对象,$$,有且只有一个参数的时候，才会有引用作用，触发ui页面更新
  //不要在builder函数中修改传进来的值
  @Builder
  userInfo(user: User) {
    Row() {
      Image($r("app.media.app_icon"))
        .width(100)
        .onClick(() => {
          this.label = "12321"
        })
      this.userDetail(user)
      Text(user.title)
    }

    Column() {
      CompUser({ message: user.title })
    }
  }

  // @Builder
  // userInfo($$: User) {
  //   Row() {
  //     Image($r("app.media.wanglihong"))
  //       .width(100)
  //     this.userDetail($$)
  //     Text($$.title)
  //   }
  //
  //   Column() {
  //     CompUser({ message: $$.title })
  //   }
  // }

  @Builder
  userDetail(user: User) {
    Column() {
      Image($r("app.media.startIcon"))
        .width(30)
      Text(user.title + ":Detail")
    }
  }

  build() {
    Column() {
      this.userInfo({ title: this.label })
      this.userInfo({ title: this.label })
      this.userInfo({ title: this.label })
      globalBuilder[0].builder({ title: this.label })
      Button("改变label").onClick(() => {
        this.label = "佩奇"
      })
      userInfoComp()

    }.width("100%")
    .height("100%")
  }
}

//全局定义，全局定义引用的时候不需要this
@Builder
function userInfoComp() {
  Row() {
    Image($r("app.media.app_icon"))
      .width(100)
    Text("王力宏")
  }
}

export class User {
  title: string = ""
}

class Person {
  personTitle: string = ""
}

@Component
struct CompUser {
  @Prop message: string

  build() {
    Text("CompUser" + this.message)
  }
}