import { common , ConfigurationConstant } from '@kit.AbilityKit'

@Entry
@Component
struct DarkPage {
  //这一节主要介绍颜色模式的切换
  @State selected: number = 0
  context = getContext (this) as common.UIAbilityContext // 获取上下文
  selectes: Array<SelectOption> = [
    {
      value: '浅色模式' ,
    },
    {
      value: '深色模式' ,
    }
  ]
  selectText: string = this.selectes[0].value as string

  build () {
    Column () {
      Text ('颜色')
        .fontSize (36)
        .fontColor ($r ('app.color.title_color'))
      Select (this.selectes)
        .height (55)
        .backgroundColor (Color.Transparent)
        .selected (this.selected)
        .value (this.selectText)
        .onSelect ((index: number) => {
          
          if (index == 1) {
            this.context.getApplicationContext ().setColorMode (ConfigurationConstant.ColorMode.COLOR_MODE_DARK)
          } else if (index == 0) {
            this.context.getApplicationContext ().setColorMode (ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT)
          }
          this.selected = index
          this.selectText = this.selectes[index].value as string
        })
    }
  }
}