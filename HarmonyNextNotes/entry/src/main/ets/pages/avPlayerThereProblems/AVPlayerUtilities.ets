import { media } from '@kit.MediaKit'
import { common } from '@kit.AbilityKit'

export class AVPlayerUtilities {
  private surfaceId: string = ''
  private count: number = 0
  private isSeek: boolean = true
  static player:media.AVPlayer

  constructor (surfaceId: string) {
    this.surfaceId = surfaceId
  }

  //监听播放状态
  setAVPlayerCallback (avPlayer: media.AVPlayer) {
    avPlayer.on ('stateChange' , (state: string , reasaon: media.StateChangeReason) => {
      switch (state) {
        case 'idle': //空闲状态
          avPlayer.release () // 释放资源，销毁与当前AVPlayer关联的所有资源
          console.log ('闲置状态：idle')
          break;
        case 'initialized': //初始化资源
          avPlayer.surfaceId = this.surfaceId //通过surfaceId就知道在那个窗口进行播放
          avPlayer.prepare () //进入准备状态
          console.log ('初始化资源：initialized')
          break;
        case 'prepared':
          avPlayer.play ()//播放
          console.log ('已准备状态：prepared')
          break;
        case 'playing':
          console.log ('播放中：playing')
          this.count++
          break;
        case 'completed':
          console.log ('播放结束：completed')
          break;
        case 'paused':
          console.log ('播放暂停：paused')
          break;
        case 'stopped':
          console.log ('播放停止：stopped')
          break;
          case 'released':
          console.log ('销毁：released')
          break;
          default:
            console.log ('未知状态：' + state)
          break;


      }

    })

  }

  async initAVPlayer () {
    // 初始化AVPlayer实例，默认media.createAVPlayer()是异步的，必需要用await，方法加一个async　↓
    let avPlayer: media.AVPlayer = await media.createAVPlayer ()
    //创建状态机制变化的函数
    this.setAVPlayerCallback (avPlayer)
    //这里当前文件无法获取上下文，因为不在这个Context上下文里面，一定要在UI页面里面去调用
    let context = getContext (this) as common.UIAbilityContext
    //获取文件,得到对象。默认也是异步获取的
    let avFile = context.resourceManager.getRawFdSync ('TestVideo.mp4')
    let avFileDescriptor: media.AVFileDescriptor = {
      //必须是需要一个文件的FD的句柄控制器才能进行文件的读取，它这个里面其实就是一个文件的读写工具类，所以说必须要通过这个FD的方法去获取了。不能通过这个Content获取
      fd: avFile.fd ,
      offset: avFile.offset ,
      length: avFile.length
    }
    AVPlayerUtilities.player = avPlayer//存储avPlayer实例
    avPlayer.fdSrc = avFileDescriptor//设置文件源
    // 初始化AVPlayer实例，默认media.createAVPlayer()是异步的，必需要用await，方法加一个async ↑

  }
}