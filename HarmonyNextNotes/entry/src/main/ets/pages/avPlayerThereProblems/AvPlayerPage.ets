import { AVPlayerUtilities } from './AVPlayerUtilities'

@Entry
@Component
struct AvPlayerPage {
  private xComponentController: XComponentController =new XComponentController()

  build () {
    Column () {
      Stack(){
        //　定义组件容器
        // 注意：所有的容器一些视频，自定义一些视频东西、自定义一些组件、自定义一些扩展，一些底层的东西，比如说视频都是通过XComponent加载
        XComponent({
          type:XComponentType.SURFACE,
          controller:this.xComponentController
        })
          .onLoad (()=>{
            let surfaceId = this.xComponentController.getXComponentSurfaceId()
            let playerUtil=new AVPlayerUtilities(surfaceId)
            playerUtil.initAVPlayer()//初始化播放器
          })
          .width ('100%')
          .height (600)
        Row () {
          Button ('播放').onClick ((event: ClickEvent) => {
            AVPlayerUtilities.player.play ()
            console.log ('播放')
          })
          Button ('暂停').onClick ((event: ClickEvent) => {
            AVPlayerUtilities.player.pause ()
            console.log ('暂停')
          })
        }

      }
    }
  }
}































