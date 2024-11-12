import { LengthMetrics , promptAction } from '@kit.ArkUI'

@Entry
@Component
struct DemoNavigation {
  @State list: Array<string> = []
  //支持双向绑定，类似State和Link，只不过可以跨组件传递，父组件可以传递给后代组件 Provide和Consume
  // @Provide和@Consume变量名称要一致，可以取别名使用
  // @Consume后代组件不可初始化变量
  @Provide ('pageInfos') pageInfos: NavPathStack = new NavPathStack ()
  TooTmp: NavigationMenuItem = {
    'value': 'Navigation' ,
    'icon': 'images:/TempImage.jpg' ,
    'action': () => {
    }

  }

  aboutToAppear (): void {
    for (let i = 0; i < 35; i++) {
      this.list.push (i + '项目')

    }
  }

  //重点　↓
  @Builder
  navTitle () {
    Text ('Navigation')
      .fontSize (35)
      .fontColor (Color.Blue)
  }

  //这个东西是控制判断名称跳转对应了哪个组件
  @Builder
  PagesMap (name: string) {
    if (name == 'chilComp') {
      ChilComp ()
    }
  }

  async reg () {
    // 第一种拦截器
    // this.pageInfos.setInterception ({
    //   // 页面跳转前返回，允许操作栈，当前跳转生效
    //   willShow: (
    //     from: NavDestinationContext | NavBar ,// 页面跳转之前栈项页面的信息
    //     to: NavDestinationContext | NavBar ,// 页面跳转之后栈项页面的信息
    //     operation: NavigationOperation ,// 当前页面跳转类型
    //     isAnimated: boolean,// 是否动画
    //   ) => {
    //
    //     let targetFrom=from as NavDestinationContext//转换类型
    //     console.log ('From'+targetFrom.navDestinationId)//targetFrom.navDestinationId唯一ID信息
    //     console.log (JSON.stringify (targetFrom.pathInfo) )// targetFrom.pathInfo:指定的参数
    //
    //     let targetTo=to as NavDestinationContext//转换类型
    //     console.log ('TO'+targetTo.navDestinationId)
    //     console.log ('TO'+targetTo.pathInfo.name)
    //     //通常校验权限，成功不用管，这里无法直接拦截阻止跳转，只能重定向
    //     if (targetTo.pathInfo.name == 'chilComp') {
    //       targetTo.pathStack.pop()
    //       targetTo.pathStack.pushPath({name:'PageOne'})
    //
    //     }
    //
    //   },
    //   // 页面跳转后回调的
    //   didShow: (
    //     from: NavDestinationContext | NavBar ,// 页面跳转之前栈项页面的信息
    //     to: NavDestinationContext | NavBar ,// 页面跳转之后栈项页面的信息
    //     operation: NavigationOperation ,// 当前页面跳转类型
    //     isAnimated: boolean,// 是否动画
    //   ) => {
    //     let targetFrom=from as NavDestinationContext//转换类型
    //     console.log ('From'+targetFrom.navDestinationId)//targetFrom.navDestinationId唯一ID信息
    //     console.log (JSON.stringify (targetFrom.pathInfo) )// targetFrom.pathInfo:指定的参数
    //
    //     let targetTo=to as NavDestinationContext//转换类型
    //     console.log ('TO'+targetTo.navDestinationId)
    //     console.log ('TO'+targetTo.pathInfo.name)
    //      if (targetTo.pathInfo.name == 'chilComp') {
    //       targetTo.pathStack.pop()
    //       targetTo.pathStack.pushPath({name:'PageOne'})
    //
    //     }
    //   },
    //   // 模式改变的，比如分栏、单面
    //   modeChange: (mode: NavigationMode)=>{}
    // })


    //  第二种拦截器
    let dialog = await promptAction.showDialog ({
      title: '提示' ,
      message: '是否进行跳转' ,
      buttons: [{
        text: '确定' ,
        color: '#ff0000' ,
      }, {
        text: '取消' ,
        color: '#ffff00' ,
      }]

    })
    // return true
    if (dialog.index == 0) {
      return true

    } else {
      return false
    }


  }

  //重点 ↑
  build () {

    //绑定
    Navigation (this.pageInfos) {
      Column () {
        List () {
          ForEach (this.list , (item: string) => {
            ListItem () {
              Text (item)
            }
            .width ('100%')
            .height (30)
            .borderRadius (10)
            .borderRadius (10)
            .onClick (async () => {
              if (await this.reg ()) {
                this.pageInfos.pushPath ({ name: 'chilComp' })

              }

            })
          })
        }
      }
      .width ('100%')
      .height ('100%')
      .backgroundColor ('#F3F5F7')
    }

    // 第一种：设置标题方式　↓
    // .title('Navigation')
    // NavigationTitleMode.Free生效
    // .titleMode(NavigationTitleMode.Free)
    // 第一种：设置标题方式　↑

    // 第二种：设置标题方式　↓
    .title (
      this.navTitle () ,
      {
        backgroundBlurStyle: BlurStyle.Thin ,
        paddingStart: LengthMetrics.vp (20) ,
      }

    )
    // 第一种：设置标题方式　↓
    // .menus([this.TooTmp,this.TooTmp])
    // NavigationTitleMode.Free不生效
    // .titleMode(NavigationTitleMode.Free)
    // 第一种：设置标题方式　↑

    // NavigationTitleMode.Mini默认会出现返回按钮
    // .titleMode (NavigationTitleMode.Free)
    // 第二种：设置标题方式　↑

    // 第三种：设置标题方式　↓
    .title ({ main: 'MainNavigation' , sub: '' })
    //NavigationTitleMode.Free生效
    .titleMode (NavigationTitleMode.Free)
    // 第三种：设置标题方式　↑

    // 第四种：设置标题方式　↓
    // .title({builder:this.navTitle(),height: 45})
    //NavigationTitleMode.Free不生效
    // .titleMode(NavigationTitleMode.Free)
    // 第四种：设置标题方式　↑
    // 需要把这个跳转的所有的判断的路由，这个里边就放置所有页面需要判断的这个跳转的组件是哪一个
    // .hideBackButton(true)// 隐藏返回按钮
    // .hideTitleBar (true) // 隐藏标题栏
    // .hideNavBar (true) // 隐藏导航栏
    .navDestination (this.PagesMap) // 重点
    .mode (NavigationMode.Stack)
  }
}

@Component
struct ChilComp {
  @Consume ('pageInfos') pageInfos: NavPathStack

  build () {
    // Navigation作为子页面的根容器，用于显示Navigation的内容区。也有生命周期
    NavDestination () {
      Stack () {
        // 弹框方式
        // 主意：所有的弹框内容Column必须需要包裹，一定是固定格式
        // 给这个对应的一个弹框的高度和宽度，给最外边给它撑满然后再给它个背景颜色，这个背景颜色就是底部的这个模糊
        // 查看协议时候经常用到
        Column () {
          Text ('子页面内容')
          Button ('闭关页面')
            .onClick (() => {
              this.pageInfos.pop ()
            })
          Button ('跳转页面')
            .onClick (() => {

            })
        }
        // .width ('80%')
        // .height ('30%')
        .backgroundColor (Color.White)

      }
      .width ('100%')
      .height ('100%')
    }.title ('chilComp')
    .mode (NavDestinationMode.DIALOG)
    .backgroundColor ('rgba(0,0,0,0.5)')
    .hideTitleBar(true)
    .onWillAppear(() => {
      console.log ('NavDestination创建后，挂载到组件树之前执行')

    })

    .onAppear(() => {
      console.log ('通用生命周期事件，挂载到组件树的时候执行')

    })
    .onWillShow(() => {
      console.log ('布局显示之前，此时页面不可见状态')

    })
    .onShown(() => {
      console.log ('布局显示之后，布局已完成')
　
    })
    .onWillHide(() => {
      console.log ('布局显示隐藏之前，引用切换到后台的时候不会触发')

    })
    .onHidden(() => {
      console.log ('隐藏后执行，Push进栈、Pop出栈。切换到后台时候')

    })
    .onWillDisappear(() => {
      console.log ('NavDestination销毁之前，卸载组件树之前执行')
    })
    .onDisAppear(() => {
      console.log ('通用生命周期事件，组件树卸载销毁的时候执行')

    })




  }
}