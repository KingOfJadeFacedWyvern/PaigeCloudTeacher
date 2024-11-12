@Entry
@Component
struct DataPanelDemo {
  //LinearGradient:线性梯度就是线性渐变
  color1:LinearGradient =new LinearGradient([
    {
      color: Color.Red,
      offset: 0
    },
    {
      color: Color.Yellow,
      offset: 1
    },

    ])
  //LinearGradient:线性梯度就是线性渐变
  color2:LinearGradient =new LinearGradient([
    {
      color: '#65EEC9A3',
      offset: 0
    },
    {
      color: '#FFEF629F',
      offset: 1
    }
    ])

  colorArray:Array<LinearGradient　| ResourceColor> = [this.color1,this.color2,this.color1,this.color2,this.color1]

  build () {
    Column () {
      DataPanel({
        values: [10],
        max:100,
        type:DataPanelType.Circle
      })
        .width (200)
        .height (200)
      Stack(){
        DataPanel({
          values: [10,20,5,30,30,5],
          max:100,
          type:DataPanelType.Circle
        })
          .width (200)
          .height (200)
          .valueColors(this.colorArray)
        Text('55%')
          .fontSize(35)

      }
      DataPanel({
        values: [10,20,5,30,30,5],
        max:100,
        type:DataPanelType.Line
      })
        .width ('100%')
        .height (100)
        .contentModifier(new DataPanelBuilder())
    }
  }
}
@Builder function buildDataPanel(config:DataPanelConfiguration){
  Column () {
    Rect()
      .width (100)
      .height (25)
      .foregroundColor(Color.Pink)
  }
}
class DataPanelBuilder implements ContentModifier<DataPanelConfiguration>{
  applyContent (): WrappedBuilder<[DataPanelConfiguration]> {
    return wrapBuilder(buildDataPanel)
    // throw new Error ('Method not implemented.')
  }

}
