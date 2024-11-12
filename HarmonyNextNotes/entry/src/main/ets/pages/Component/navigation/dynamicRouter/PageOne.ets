@Component
struct PageOne {
  pageInfos: NavPathStack = new NavPathStack ()
  build () {
    NavDestination(){
      Text('子页面内容')
    }
    .onReady ((nav:NavDestinationContext)=>{
      this.pageInfos=nav.pathStack
      console.log (JSON.stringify(nav.pathInfo.param))
    })
    .onAppear (()=>{
      // let data = this.pageInfos.getParamByName('PageOne') as Array<Record<string,number>>
      // console.log (data.toString())
      let data = this.pageInfos.getParamByName('PageOne') as Array<number>
      console.log (data[0].toString())

    })
    // .title('PageOne')
  }
}
@Builder
export function PageOneBuilder() {
  PageOne()
}