import { mediaquery } from '@kit.ArkUI'
import globalBuilder from '../global/GlobalBuilder'

let listener: mediaquery.MediaQueryListener = mediaquery.matchMediaSync ('(550px<=width)')

@Entry
@Component
struct DemoMediaQuery {
  @State bgColor: ResourceColor = Color.Red

  aboutToAppear (): void {
    listener.on ('change' , (MediaQueryResult: mediaquery.MediaQueryResult) => {
      if (MediaQueryResult.matches) {
        this.bgColor = Color.Yellow
      } else {
        this.bgColor = Color.Red
      }
    })

  }

  build () {
    Column () {
      Text ('匹配文本')
        .newExtend (this.bgColor)
      globalBuilder.builder()
    }

  }
}

@Extend (Text)
function newExtend (color: ResourceColor) {
  .width (100)
  .height (200)
  .backgroundColor (color)
  .fontSize (25)
  .fontColor (Color.Orange)
}
