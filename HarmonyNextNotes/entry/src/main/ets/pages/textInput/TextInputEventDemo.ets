@Entry
@Component
struct TextInputEventDemo {
  controller:TextInputController = new TextInputController()
  build () {
    Column ({space: 10}) {
      TextInput({text: 'TextInput',placeholder: '请输入内容',controller:this.controller})

        // .onChange ((value: string) => {
        //   //value:1.键盘输入、2复制粘贴、3.键盘快捷键Ctrl+V、会触发
        //   console.log ('onChange: ' + value)
        // })


        // //相当于按下回车键，会触发这个事件。这个英语单词Submit是提交的意思。
        // .onSubmit ((enterKey:EnterKeyType,event:SubmitEvent)=>{
        //   //模拟器和预览器并没有软键盘
        //   console.log (JSON.stringify(enterKey)+JSON.stringify(event))
        // })

        // //是否编辑中，根据焦点，触发这个事件
        // .onEditChange ((isEditing:boolean)=>{
        //   console.log ('onEditChange: ' + isEditing)
        // })


        // .type(InputType.Password)
        // 是否显示密码,触发这个事件
        .onSecurityStateChange ((isShowPassWord:boolean)=>{
          console.log ('isShowPassWord: ' + isShowPassWord)
        })
        .onClick(() => {
            // this.controller.caretPosition(3)
            // this.controller.setTextSelection(2,6)
            this.controller.stopEditing()
        })

      TextInput()


    }
  }
}