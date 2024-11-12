import { HOT_CITY } from './CityView'
import { LengthMetrics } from '@kit.ArkUI'

@Component
export default struct HotCity {
  build () {
    Column () {
      Row(){
        Text('国内热门城市')
          .fontSize(15)
          .fontColor('#808084')
      }
      .width ('100%')
      .justifyContent (FlexAlign.Start)
      .margin ({ top: 10, bottom: 10 })
      Flex({
        direction: FlexDirection.Row,
        wrap: FlexWrap.Wrap,
        space:{
          main:LengthMetrics.vp(10),
          cross:LengthMetrics.vp(10)
        }
      }){
        ForEach (HOT_CITY , (item: string) => {
          Text (item)
            .width ('22%')
            .height (36)
            .fontSize(15)
            .backgroundColor ('#D7D7D7')
            .textAlign(TextAlign.Center)
            .borderRadius(20)

        })
      }
    }
  }
}