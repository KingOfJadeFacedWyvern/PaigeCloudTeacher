@Entry
@Component
struct ProgressDemo {
  @State progressCount: number = 0
  aboutToAppear(): void {
    setInterval(() => {
      if (this.progressCount >= 100) {
        this.progressCount = 0
      }
      this.progressCount+=10
    }, 300)
  }
  @State handlePopup: boolean = false
  build () {
    Column ({space: 25}) {
      /*Total：总数量，总的长度
      Value：进度值
      Type：进度条的样式类型*/
      //style这个属性最重要的
      Progress ({value: 20,total:100,type: ProgressType.Linear})
        .width (300)
        .height (55)
      // ProgressType.Ring:环形无刻度的样式
      Progress ({ value: 20 , total: 100 , type: ProgressType.Ring })
        .width (300)
        .height (55)
        .style({strokeWidth: 20,status: ProgressStatus.LOADING})
      // ProgressType.Eclipse:椭圆无刻度的样式
      Progress ({ value: 20 , total: 100 , type: ProgressType.Eclipse })
        .width (300)
        .height (55)
      // ProgressType.ScaleRing:环形带刻度的样式
      Progress ({ value: 20 , total: 100 , type: ProgressType.ScaleRing })
        .width (300)
        .height (55)
        // 刻度的scaleCount总数量和scaleWidth刻度的宽度粗细,strokeWidth进度条的宽度
        .style({scaleCount: 10, scaleWidth: 5, strokeWidth: 20})
        // ProgressType.Capsule:胶囊样式
      Progress ({ value:this.progressCount , total: 100 , type: ProgressType.Capsule })
        .width (300)
        .height (55)
        .style({content: `${this.progressCount}%`})

    }.margin ({ top: 20})
  }
}