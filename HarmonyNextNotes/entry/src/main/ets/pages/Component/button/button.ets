@Entry
@Component
struct ButtonPage {

  build () {
    Column ({ space: 10 }) {
      //   1. 定义:Button
      Button ('我是按钮')
      //   2.定义:Button,stateEffect: false点击是否有效果,type: ButtonType默认样式
      Button ('我是按钮' , {
        type: ButtonType.Normal ,
        stateEffect: false
      })
      //   3.子组件定义:Button,具有子组件的定义,子组件可以写任何布局内容。
      Button () {
        // 只能存在一个子组件,否则会报错.子组件可以基础组件，也可以是容器组件
        Row () {
          Image ($r ('app.media.app_icon'))
            .width (55)
          Text ('我是子组件')
        }
      }

      // button属性
      Button ('我是按钮')
        // 不是重点　↓
        .fontSize (25)
        .fontColor (Color.Orange)
        .backgroundColor (Color.Red)
        .border ({ width: 1 , color: Color.Green , style: BorderStyle.Solid })
        // 不是重点　↑
        // 设置button按钮角色
        // ButtonRole.NORMA 正常按钮
        // ButtonRole.ERROR 警告按钮
        .role (ButtonRole.ERROR)
      　// 定制button区域内容
        // 才是重点　↓
        .contentModifier(new buttonStyle())
      　// 才是重点　↑
    }
  }
}
@Builder function  button1(config: ButtonConfiguration) {
  Column () {
    Text ('获取文本内容：'+ config.label)
    Text ('是否按压：'+ config.pressed)
    Text ('获取开启状态：'+ config.enabled)

    Text ('这就是个自定义内容区域的按钮')

  }

}
class buttonStyle implements ContentModifier<ButtonConfiguration>{
  applyContent (): WrappedBuilder<[ButtonConfiguration]> {
   return wrapBuilder(button1)
    // throw new Error ('Method not implemented.')
  }

}