@Entry
@Component
struct DemoTabs {
  @State currentIndex: number = 0
  @State imaArr: Array<ImageItem> = [
    {
      image: $r('app.media.app_icon'),
      imageSelected: $r('app.media.WeddingDress')
    },
    {
      image: $r('app.media.app_icon'),
      imageSelected: $r('app.media.startIcon')
    },
    {
      image: $r('app.media.app_icon'),
      imageSelected: $r('app.media.app_icon')
    }
  ]
  // title: string, icon: Resource, selectedIcon: Resource, index: number
  @Builder tabBarItem(title: string, index: number){
    Column () {
      Image (this.currentIndex==index? this.imaArr[index].imageSelected:this.imaArr[index].image)
        .width (32)
        .aspectRatio(1)
      Text(title)
    }
     .onClick(() => {
         this.currentIndex = index
     })
  }
  build () {
    Tabs({barPosition:BarPosition.End}){
      TabContent(){
        Column () {
          Text('TabContent')
        }
        .width('100%')
        .height('100%')
        .backgroundColor (Color.Red)
      }.tabBar(this.tabBarItem('主页',this.currentIndex))
      TabContent(){
        Column () {
          Text('TabContent')
        }
        .width('100%')
        .height('100%')
        .backgroundColor (Color.Yellow)
      }.tabBar(this.tabBarItem('主页',this.currentIndex))
      TabContent(){
        Column () {
          Text('TabContent')
        }
        .width('100%')
        .height('100%')
        .backgroundColor (Color.Blue)
      }.tabBar(this.tabBarItem('主页',this.currentIndex))

    }
    .vertical(false)
    // .barWidth(110)
    .barHeight(100)
    .scrollable(false)
    // barMode(BarMode.Fixed)的意思是固定，无法滚动。设置了barWidth有宽度，设置完了固定宽度以后，内容不足展示出来就会点点代替了
    .barMode(BarMode.Fixed)
  }
}
interface ImageItem {
  image: Resource
  imageSelected: Resource
}