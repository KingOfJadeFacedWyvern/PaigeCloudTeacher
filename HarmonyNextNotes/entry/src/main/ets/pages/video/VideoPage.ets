@Entry
@Component
struct VideoPage {
  private innerResource: Resource = $rawfile("UTools.mp4")
  private previewUris: Resource = $r ('app.media.background')
  private controller: VideoController | undefined = new VideoController ()

  build () {
    Column () {
      // 自带的视频播放
      Video ({
        src: this.innerResource ,
        previewUri: this.previewUris ,
        controller: this.controller ,
      })
    }
  }
}