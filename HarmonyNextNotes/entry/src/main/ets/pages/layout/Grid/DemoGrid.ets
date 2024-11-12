@Entry
@Component
struct DemoGrid {
  @State list:string[] = []
  aboutToAppear(): void {
    for (let i = 1; i <26; i++) {
      this.list.push(i.toString())

    }
  }
  @State text: string = ''
  @Builder builders () {
    Text(this.text)
      .width(60)
      .height(60)
      .fontSize(16)
      .backgroundColor(Color.Orange)
      .textAlign(TextAlign.Center)

  }
  changeIndex (itemIndex: number,insertIndex:number) {
    let temp:string;
    temp=this.list[itemIndex];
    this.list[itemIndex]=this.list[insertIndex];
    this.list[insertIndex]=temp;
  }
  layoutOptions: GridLayoutOptions = {
    // 只有这一个值，而且必需
    // 大小规则的GridItem在grid中占的行数和列数
    regularSize: [1,1],
    // 指定Grid索引在Grid中占用的一行，还是需要rowsTemplate和columnsTemplate二选一
    // 如果说是columnsTemplate打开，竖向占用一列。rowsTemplate则是横向占用一行
    irregularIndexes: [0,1,2,10],
    // 在irregularIndexes基础上，分别设置，占用的行数和列数
    // onGetIrregularSizeByIndex: (index: number) => {
    //   return [0,2]
    // }
    // onGetRectByIndex: (index: number) => {
    //   if (index==0) {
    //     // columnsTemplate和rowsTemplate需要同时打开，并且根据索引返回对应的GridItem
    //     // 四位分别代表是什么：起始位置RowStart、结束位置ColumnStart、行数占用、列数占用
    //     return [2,0,2,1]
    //
    //   }else {
    //     return [5,5,1,1]
    //   }
    // }
  }
  build () {
    Grid (undefined,this.layoutOptions) {
      ForEach (this.list , (l: string) => {
        ForEach (this.list , (item: string ) => {
          GridItem () {
            Text (item)
              .width (55)
              .height (55)
              .fontColor (Color.White)
              .backgroundColor (Color.Pink)
          }
          // .backgroundColor (Color.Orange)

        })
      })
    }
    
    .columnsTemplate('1fr 1fr 1fr 1fr 1fr ')
    .rowsTemplate('1fr 1fr 1fr 1fr 1fr ')
    .columnsGap(10)
    .rowsGap(10)
    .height(300)
    .editMode(true)
    // 1.想让其有动画效果，必需rowsTemplate和columnsTemplate二选其一才会生效
    // 2.Grid不可以配置undefined,this.layoutOptions否则也不生效
    .supportAnimation(true)
    .onItemDragStart　((event: ItemDragInfo, itemIndex: number) =>{
      this.text = this.list[itemIndex]
      return this.builders()
    })
    .onItemDrop　((
      event: ItemDragInfo,
      itemIndex: number,
      insertIndex: number,
      isSuccess: boolean
    )=>{
      if (!isSuccess || insertIndex>=this.list.length) {
        return
      }
      this.changeIndex(itemIndex,insertIndex)
    })

  }
}