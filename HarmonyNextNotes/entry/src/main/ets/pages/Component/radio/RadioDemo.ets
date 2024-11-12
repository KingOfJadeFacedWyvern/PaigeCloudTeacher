@Entry
@Component
struct RadioDemo {
  @Builder
  indicatorBuilder () {
    Image ($r ('app.media.app_icon'))

  }

  @State isChecked: boolean = true

  build () {
    Column () {
      Row () {
        Text ('value1')
        // Radio设置为这个属性indicatorType的意思是显示类型
        Radio ({ value: 'value1' , group: 'Group' , indicatorType: RadioIndicatorType.DOT })
          .onChange ((isChecked: boolean) => {
            console.log ('isChecked:' + isChecked)
          })
          .checked(this.isChecked)


      }
      Text(this.isChecked +'')
      Row () {
        Text ('value2')
        Radio ({
          value: 'value2' ,
          group: 'Group' ,
          indicatorType: RadioIndicatorType.CUSTOM ,
          // 自定义显示类型: indicatorBuilder必需要用 indicatorType: RadioIndicatorType.CUSTOM，配合在一起使用才会有效果
          indicatorBuilder: () => {
            this.indicatorBuilder ()
          }
        })

      }

    }
  }
}