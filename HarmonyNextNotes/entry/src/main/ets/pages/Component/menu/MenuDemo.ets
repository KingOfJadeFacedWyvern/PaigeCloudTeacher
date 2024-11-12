@Entry
@Component
struct MenuDemo {
  @Builder buildMenu () {
   Menu() {
     MenuItem ({ content: '游戏' ,labelInfo:'111' })
   }
  }
  @Builder menus () {
    //　不能作为普通组件使用，应该和bindMenu和bindContentMenu方法配合使用
    Menu () {
      MenuItem ({ content: '首页' ,labelInfo:'111' })
      MenuItem ({ startIcon: $r('app.media.app_icon'),content: '首页'  })
      MenuItem ({ content: '首页' , endIcon: $r('app.media.app_icon')})
      MenuItem({ content: '首页',builder:this.buildMenu()})
    }
  }
  @State handlePopup: boolean = false
  build () {
    Column () {
      Text('这是菜单')
        .fontSize(45)
        .bindMenu(this.menus)
    }
    .width('100%')
    .height('100%')
    .backgroundColor (Color.Yellow)

  }
}