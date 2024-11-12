import { ButtonOptions , LoadingDialog , ConfirmDialog , SelectDialog , TipsDialog , AlertDialog ,CustomContentDialog } from '@kit.ArkUI'

@Entry
@Component
struct DialogDemoPage {
  //提示对话框,tipsDialog和confirmDialog唯一区别（tipsDialog有图片必须填图片，confirmDialog没有图片）
  tipsDialog: CustomDialogController = new CustomDialogController ({
    builder: TipsDialog ({
      imageRes: $r ('app.media.background') ,
      imageSize: { width: 100 , height: 100 } ,
      title: '是否确定关闭' ,
      content: '提示内容' ,
      checkTips: '请打钩验证码' ,
      //默认选中
      isChecked: true ,
      //
      checkAction: (isChecked: boolean) => {

      } ,
      primaryButton: {
        value: '确定' ,
        action: () => {
          this.tipsDialog.close ()
        } ,
        background: Color.Orange ,
        fontColor: Color.White ,
      } ,
      secondaryButton: {
        value: '取消' ,
        action: () => {
          this.tipsDialog.close ()
        } ,
        background: Color.Orange ,
        fontColor: Color.White ,
        role: ButtonRole.ERROR
      }

    })
  })
  //选择Dialog
  selectDialog: CustomDialogController = new CustomDialogController ({
    builder: SelectDialog ({
      title: '是否确定关闭' ,
      selectedIndex: 0 ,
      confirm: {
        value: '确定' ,
        action: () => {
          this.selectDialog.close ()
        } ,
      } ,
      content: '提示内容' ,
      radioContent: [
        {
          title: '选项一' ,
          action: () => {
            console.log ('选项一')
          }
        },
        {
          title: '选项二' ,
          action: () => {
            console.log ('选项二')
          }
        },
        {
          title: '选项三' ,
          action: () => {
            console.log ('选项三')
          }
        }
      ]
    })
  })
  // 弹出框+勾选，和TipsDialog唯一区别就是没有图片
  confirmDialog: CustomDialogController = new CustomDialogController ({
    builder: ConfirmDialog ({
      title: '是否确定关闭' ,
      content: '提示内容' ,
      isChecked: true ,
      checkTips: '请打钩验证码' ,
      primaryButton: {
        value: '确定' ,
        action: () => {
          this.tipsDialog.close ()
        } ,
        role: ButtonRole.ERROR ,
        background: Color.Orange ,
        fontColor: Color.White ,
      } ,
      secondaryButton: {
        value: '取消' ,
        action: () => {
          this.tipsDialog.close ()
        } ,
        background: Color.Orange ,
        fontColor: Color.White ,
      }

    }) ,
    autoCancel: true ,
    customStyle: true ,
    alignment: DialogAlignment.Center ,

  })
  alertDialog: CustomDialogController = new CustomDialogController ({
    builder: AlertDialog ({
      primaryTitle: '一级标题' ,
      secondaryTitle: '二级标题' ,
      content: '提示内容' ,
      primaryButton: {
        value: '确定' ,
        action: () => {
          this.tipsDialog.close ()
        } ,
        role: ButtonRole.ERROR ,
        background: Color.Orange ,
        fontColor: Color.White ,
      } ,
      secondaryButton: {
        value: '取消' ,
        action: () => {
          this.tipsDialog.close ()
        } ,
        background: Color.Orange ,
        fontColor: Color.White ,
      }

    })

  })
  loadingDialog: CustomDialogController = new CustomDialogController ({
    builder: LoadingDialog ({
      content: '加载中'
    })


  })


  //最通用
  customContentDialog: CustomDialogController = new CustomDialogController ({
    builder: CustomContentDialog ({
      // primaryTitle: '一级标题' ,
      // secondaryTitle: '二级标题' ,
      contentBuilder: ()=> {
        this.ArrowFunctions()
      },
      buttons:[
        // 这里最多4个按钮,超过2个按钮,默认竖直排列,无法横向排列
        {
          value: '确定' ,
          action: () => {
            this.tipsDialog.close ()
          } ,
          role: ButtonRole.ERROR ,
          background: Color.Orange ,
          fontColor: Color.White ,
          buttonStyle:ButtonStyleMode.TEXTUAL
        } ,

        {
          value: '取消' ,
          action: () => {
            this.tipsDialog.close ()
          } ,
          background: Color.Orange ,
          fontColor: Color.White ,
          buttonStyle:ButtonStyleMode.TEXTUAL
        },

        // {
        //   value: '获取' ,
        //   action: () => {
        //     this.tipsDialog.close ()
        //   } ,
        //   background: Color.Orange ,
        //   fontColor: Color.White ,
        //   buttonStyle:ButtonStyleMode.TEXTUAL
        // },
        //
        // {
        //   value: '信息' ,
        //   action: () => {
        //     this.tipsDialog.close ()
        //   } ,
        //   background: Color.Orange ,
        //   fontColor: Color.White ,
        //   buttonStyle:ButtonStyleMode.TEXTUAL
        // },

      ]

    })

  })
  @Builder ArrowFunctions () {
    Column () {
      Text('这是一段内容')
    }

  }

  build () {
    Column ({ space: 10 }) {
      Button ('Select Dialog')
        .onClick (() => {
          this.selectDialog.open ()
        })
      Button ('Tips Dialog')
        .onClick (() => {
          this.tipsDialog.open ()
        })
      Button ('ConfirmDialog')
        .onClick (() => {
          this.confirmDialog.open ()
        })
      Button ('alertDialog')
        .onClick (() => {
          this.alertDialog.open ()
        })
      Button ('loadingDialog')
        .onClick (() => {
          this.loadingDialog.open ()
        })
      Button ('customContentDialog')
        .onClick (() => {
          this.customContentDialog.open ()
        })
    }
  }
}