@Entry
@Component
struct CheckboxDemo {
  build () {
    Column () {
      // group:分组只能和CheckboxGroup组件联合使用才有意义
      Checkbox ({ name: 'checkbox1' , group: 'group1' })
      Checkbox ({ name: 'checkbox2' , group: 'group1' })// 选中状态
        .select (true)
        .selectedColor (Color.Orange)
      Checkbox ({ name: 'checkbox3' , group: 'group1' })
      Checkbox ({ name: 'checkbox4' , group: 'group1' })// 未选中状态
        .unselectedColor (Color.Red)// 选中状态
        .select (true)// 勾选样式
        .mark ({
          strokeColor: Color.Blue ,
          strokeWidth: 5 ,
          size: 15
        })// 勾选形状:CheckBoxShape.ROUNDED_SQUARE圆角正方形,默认值圆形
        .shape (CheckBoxShape.ROUNDED_SQUARE)
      // .contentModifier (new checkBoxStyle ()) // 自定义内容
      CheckboxGroup ({ group: 'group1' })
        .selectAll (true)
        .selectedColor (Color.Pink)
        .unselectedColor (Color.Blue)
        .mark ({
          strokeColor: Color.Blue ,
          strokeWidth: 5 ,
          size: 15
        })// 勾选形状:CheckBoxShape.ROUNDED_SQUARE圆角正方形,默认值圆形
        .checkboxShape (CheckBoxShape.ROUNDED_SQUARE)
        .onChange ((event: CheckboxGroupResult) => {
          //status(event里面存储状态标志):0全部选中,1部分选中,2全部未选中
          console.log (JSON.stringify (event))
        })

    }
  }
}

@Builder
function checkbox1 (config: CheckBoxConfiguration) {
  Column () {
    Text ('获取文本内容：' + config.name)
    // Text ('获取开启状态：'+ config.selected)

    // Text ('这就是个自定义内容区域的按钮')

  }

}

class checkBoxStyle implements ContentModifier<CheckBoxConfiguration> {
  applyContent (): WrappedBuilder<[CheckBoxConfiguration]> {
    return wrapBuilder (checkbox1)
    // throw new Error ('Method not implemented.')
  }
}