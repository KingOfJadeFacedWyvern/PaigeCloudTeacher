@Entry
@Component
struct DemoNavigationDynamicRouter {
  /*
   * 系统动态路由
   *   第一步：定义pageInfos: NavPathStack = new NavPathStack ()
   *   第二步：要在Navigation{()}加上this.pageInfos
   *   第三步：要在module.json5里面加上，在"module"层级增加配置项"routerMap": "$profile:route_map",
   *   第四步：这个路径resources/base/profile/，创建这个文件：route_map.json。写配置项：{"routerMap"[{"name": "", "buildFunction":,"pageSourceFile":,}]}
   *   第五步：被跳转的页面中，要定义@Builder，并且是全局@Builder函数，并且需要执行组定义组件调用，并且还要Export
   * @Builder
   * export function PageOneBuilder() {
   *    PageOne()
   * }
   *   第六步：子页面要在onReady()的时候给navPathStack上下文
   *.onReady ((nav:NavDestinationContext)=>{
   *   this.pageInfos=nav.pathStack
   * })
   * */
  pageInfos: NavPathStack = new NavPathStack ()
  @State index: number = 0

  build () {
    Navigation (this.pageInfos) {
      Column () {
        Text ('父页面')
        Button ('跳转页面')
          .onClick (() => {
            // this.pageInfos.pushPath ({ name: 'PageOne' ,param:this.index})
            this.pageInfos.pushPathByName('PageOne',this.index)
            // this.pageInfos.pushPathByName('PageOne', {'index' this.index } as Record<string,number>)


          })
      }
      .width ('100%')
      .height ('100%')
      .backgroundColor ('#F3F5F7')
    }
  }
}