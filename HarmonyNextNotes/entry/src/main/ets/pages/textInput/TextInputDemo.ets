@Entry
@Component
struct TextInputDemo {
  textInputController: TextInputController = new TextInputController ()
  textAreaController: TextAreaController = new TextAreaController ()

  @Builder
  aa () {
    Select ([
      {
        value: '第一个选项1' ,
      },
      {
        value: '第一个选项2' ,
      },
      {
        value: '第一个选项3' ,
      }
    ])
      .height(55)
      .backgroundColor (Color.Transparent)
      .selected(0)
      .value('第一个选项1')
  }

  build () {
    Column ({ space: 5 }) {
      TextInput ({ text: '' , placeholder: '请输入内容' , controller: this.textInputController })
        /* *
         * . style:CancelButtonStyle.CONSTANT清除按钮常显的样式
         * . style:CancelButtonStyle.INVISIBLE隐藏清除按钮的样式
         * . style:CancelButtonStyle.INPUT清除按钮输入样式，输入内容后，会显示
         * */
        .cancelButton({
          style:CancelButtonStyle.INPUT,
          icon: {src:$r ('app.media.app_icon')}
        })
      // 输入多行文字
      TextArea ({
        text: '' ,
        placeholder: '请输入多行文字' ,
        controller: this.textInputController

      })
      Text ('属性')
      TextInput ({ placeholder: '请输入内容' })// InputType:NEW_PASSWORD手机上有一个东西叫做密码保险箱，自动存储密码
        // 支持密码保险箱自动保存和填充:NEW_PASSWORD、NUMBER_PASSWORD、USER_NAME、NUMBER_DECIMAL
        .type (InputType.Normal)// 自动填充类型:也是密码保险箱默认自动填充的类型，一定主意一点，起用系统自动启动了密码保险箱才能有效
        .contentType (ContentType.USER_NAME)//占位符颜色
        .placeholderColor (Color.Orange)//占位符字体
        .placeholderFont ({
          size: 35 ,
          weight: FontWeight.Bold
        })//这个是软键盘，比较重要
        .enterKeyType (EnterKeyType.Done)//光标颜色
        .caretColor (Color.Red)//最大长度，这个使用比较多，默认100
        .maxLength (9)//输入过滤器，这个比较重要，可以限制输入的字符其实正则表达式
          // .inputFilter('^[0-9]+$')
          //复制选项，这个比较重要，可以限制复制的内容
        .copyOption (CopyOptions.InApp)// @formatter:off
        //---关于Password后缀图标设置　↓
        //是否显示密码图标
        .showPasswordIcon (true)
          //密码图标:自定义Password未尾图标
        .passwordIcon ({
          onIconSrc: $r ('app.media.app_icon') ,
          offIconSrc: $r ('app.media.foreground') ,
        })
          //是否显示密码
        .showPassword (false)
          //---关于Password后缀图标设置　↑
          // @formatter:on

        .style (TextInputStyle.Default)//输入框样式
        .textAlign (TextAlign.Center)//对齐方式
        .selectedBackgroundColor (Color.Pink)//长按输入内容进行选择时的背景颜色
        .caretPosition (5)//光标位置
        .defaultFocus (true)//默认获取焦点
        .showUnderline (true)//是否显示下划线,注意TextInput类型InputType类型为Normal的时候才生效
        .underlineColor (Color.Red)//下划线颜色
        .showUnit (this.aa ())
      TextInput ({ text: '' , placeholder: '请输入内容' , controller: this.textInputController })
        //输入框计数器
        //thresholdPercentage:输入框计数器阈值百分比,当前输入字符数除以最大字符数
        .showCounter(true,{thresholdPercentage:50,highlightBorder:true})
        // 最大长度
        .maxLength(6)
    }
  }
}