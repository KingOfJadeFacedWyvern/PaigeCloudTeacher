import { CITY_DATA , TAB_VALUE } from './CityView'
import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct DemoAlphabetIndexer {
  build () {
    Column () {
      AlphabetIndexer({arrayValue: TAB_VALUE,selected:0})　
        .color(Color.Red)//其它选项颜色
        .selectedColor(Color.Blue)
        .selectedBackgroundColor(Color.Yellow)
        // .selectedFont({size: 18, weight: FontWeight.Bold})
        .usingPopup(true)//还是使用提示弹出窗，usingPopup(true)和alignStyl需要联合使用才生效
        .alignStyle(IndexerAlign.Left)//在索引列表的右边、左边、开始位置
        //非字母　↓
        .popupColor(Color.Red)
        .popupSelectedColor(Color.Blue)//设置提示弹窗非字母部分选中的颜色
        .popupUnselectedColor(Color.Gray)
      　//非字母　↑
        .popupPosition({x: 20, y: 20})
        .popupTitleBackground(Color.Yellow)
        .popupFont({size: 35, weight: FontWeight.Bold})
        .popupItemBorderRadius(20)
        .popupBackground(Color.Transparent)
        .popupBackgroundBlurStyle(BlurStyle.NONE)
        .itemBorderRadius(20)
        .onSelect((index:number)=>{
          promptAction.showToast ({ message: `${index}` })
        })
        .onRequestPopupData((index:number)=>{
          return CITY_DATA[index].city
        })
        .onPopupSelect((index:number)=>{
          promptAction.showToast ({ message: `${index}` })
        })
    }
    .width('100%')
    .height('100%')
  }
}