import { CityType , CITY_DATA , TAB_VALUE } from './CityView'
import { promptAction } from '@kit.ArkUI'

@Component
export default struct CityList {
  @State indexNumber:number = 0
  @Builder titleBuilder(name: string) {
     Text(name)
       .padding ({ bottom: 10})
   }
   scroller:Scroller=new Scroller()

  build () {
   Stack({alignContent: Alignment.TopEnd}) {
     Column () {
       List({space: 10,scroller:this.scroller}) {
         ForEach (CITY_DATA, (item: CityType ) => {
           ListItemGroup({
             header:this.titleBuilder(item.name),
             space: 10
           }) {
             ForEach (item.city , (city: string ) => {
              ListItem() {
                Text(city)
                  .fontSize(16)
                  .fontColor('#4A4B4E')
              }
             })
           }

         })
       }
       .scrollBar(BarState.Off)
       .onScrollIndex((startIndex: number, endIndex: number, centerIndex: number)=>{
        this.indexNumber =startIndex
         promptAction.showToast ({ message: `${startIndex}` })
       })
     }
     AlphabetIndexer({arrayValue: TAB_VALUE,selected:this.indexNumber})
       .margin ({ top: 10})
       .selectedBackgroundColor('#5FA7FD')
       .selectedColor(Color.White)
       .itemBorderRadius(5)
       .itemSize(22)
       .selectedFont({weight: FontWeight.Bold, size: 16})
       .usingPopup(true)
       .alignStyle(IndexerAlign.Right)
       .popupPosition({x: 20})
       .popupColor(Color.Red)
       .popupFont({size: 20, weight: FontWeight.Bold})
       .popupItemBorderRadius(5)
       .onSelect((index:number)=>{
         this.scroller.scrollToIndex(index)
       })







   }
   .margin ({ top: 10})
    .layoutWeight(1)
  }
}