import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct ExampleList {
  @State list: Array<string> =['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19',
      '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '30', '31', '32', '33', '34', '35', '36',
      '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50', '51', '52', '53', '54', '55',
      '56', '57', '58', '59', '60']
  @State egLanes: LengthConstrain = { minLength: 200 , maxLength: 300 }
@Builder itemEnd(index: number) {
    Button(){
      Image ($r ('app.media.Deleted'))
        .width (20)
    }
     .onClick(() => {
         this.list.splice (index , 1)
     })
    .backgroundColor (Color.Transparent)
}
  build () {
    Scroll () {
      Column () {

        Text ('玉面飞龙之王')
          .width ('100%')
          .height (100)
          .backgroundColor (Color.Pink)
        List () {
          ForEach (this.list , (item: string , index: number) => {
            ListItem () {
              Row ({ space: 15 }) {
                Image ($r ('app.media.WeddingDress'))
                  .width (30)
                  .borderRadius (50)
                Text (item + '文本')
                  .fontSize (35)
              }
              .width ('100%')
              .height (80)
              // .borderRadius(8)
              .backgroundColor (Color.White)
            }
            .swipeAction({
              start:{
                builder:this.itemEnd(index)
              },
              end:{
                builder:this.itemEnd(index)
              },
              edgeEffect:SwipeEdgeEffect.Spring,
              onOffsetChange:(offset:number)=>{
                promptAction.showToast ({ message: 'offset:' + offset + 'px' })

              }
            })
          })
        }
        // .width(800)
        .listDirection (Axis.Vertical)
        .lanes (1 , 10)
        // .lanes(this.egLanes)
        // .scrollBar(BarState.Off)
        .divider ({
          strokeWidth: 2 ,
          color: Color.Red ,
          startMargin: 15 ,
          endMargin: 15
        })
        .edgeEffect (EdgeEffect.Spring)
        // .chainAnimation(true)
        // .multiSelectable(true)
        .alignListItem (ListItemAlign.End)
        .enableScrollInteraction (true)
        .nestedScroll ({
          scrollForward: NestedScrollMode.PARENT_FIRST ,
          scrollBackward: NestedScrollMode.SELF_FIRST ,
        })
        .height ('100%')
      }
    }
    .width ('100%')
    .height ('100%')
    .padding (10)
    .backgroundColor (Color.Gray)

  }
}