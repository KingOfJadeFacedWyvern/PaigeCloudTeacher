import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct otherDialogDemo {
  private selectedData: Date = new Date ()
  private selectTime: Date = new Date ('2020-12-25T08:30:00')
  private select: number | number[] = 0
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4']
  @State v: string = ''

  build () {
    Column ({ space: 10 }) {
      Button ('警告弹窗AlertDialog')
        .onClick (() => {
          AlertDialog.show ({
            title: '警告' ,
            message: '警告信息' ,
            autoCancel: true ,
            alignment: DialogAlignment.Center ,
            offset: { dx: 0 , dy: -20 } ,
            gridCount: 3 ,
            confirm: {
              value: 'Button' ,
              action: () => {
                console.info ("Button clicked")
              } ,
              backgroundColor: Color.Blue ,
              fontColor: Color.White ,
            } ,
            cancel: () => {
              console.info ("cancel clicked")
            } ,
            onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
              console.info ('reason' + JSON.stringify (dismissDialogAction.reason))
              console.log ('dialog onWillDismiss')
              if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                dismissDialogAction.dismiss ()
              }
              if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                dismissDialogAction.dismiss ()
              }
            }
          })

        })
        .backgroundColor ('#0x317AFF')
      Button ('列表选择器ActionSheet')
        .onClick (() => {
          ActionSheet.show ({
            title: '列表选择器' ,
            subtitle: 'subtitle' ,
            message: 'message' ,
            autoCancel: true ,
            confirm: {
              defaultFocus: true ,
              value: 'Button' ,
              action: () => {
                console.info ("Button clicked")
              } ,
            } ,
            cancel: () => {
              console.info ("cancel clicked")
            } ,
            alignment: DialogAlignment.Bottom ,
            offset: { dx: 0 , dy: -20 } ,
            sheets: [
              {
                title: 'Button' ,
                action: () => {
                  console.info ("Button clicked 1")
                } ,
              },
              {
                title: 'Button' ,
                action: () => {
                  console.info ("Button clicked 2")
                } ,
              },
              {
                title: 'Button' ,
                action: () => {
                  console.info ("Button clicked 3")
                } ,
              },
              {
                title: 'Button' ,
                action: () => {
                  console.info ("Button clicked 4")

                }
              }
            ]

          })

        })
      Button ('日期选择器CalenderPickerDialog')
        .onClick (() => {
          CalendarPickerDialog.show ({
            selected: this.selectedData ,
            backgroundColor: Color.Pink ,
            backgroundBlurStyle: BlurStyle.Thin ,
            //弹窗点击确认事件回调
            onAccept: (date: Date) => {
              console.info ('date' + JSON.stringify (date))
              this.selectedData = date
              promptAction.showToast ({ message: '触发：onAccept' })
            } ,
            //弹窗点击取消事件回调
            onCancel: () => {
              console.info ('cancel clicked')
              promptAction.showToast ({ message: '触发：onCancel' })
            } ,
            //日期改变事件回调
            onChange: (date: Date) => {
              console.info ('date' + JSON.stringify (date))
              this.selectedData = date
              promptAction.showToast ({ message: '触发：onChange' })
            } ,
            //弹窗弹出时事件回调
            onDidAppear: () => {
              promptAction.showToast ({ message: '触发：onDidAppear' })

            } ,
            //弹窗消失时事件回调
            onDidDisappear: () => {
              promptAction.showToast ({ message: '触发：onDidDisappear' })
            } ,
            //弹窗显示动效之前事件回调
            onWillAppear: () => {
              promptAction.showToast ({ message: '触发：onWillAppear' })
            } ,
            //弹窗退出动效之前事件回调
            onWillDisappear: () => {
              promptAction.showToast ({ message: '触发：onWillDisappear' })
            } ,

          })
        })
      Button ('时间选择器DatePickerDialog')
        .onClick (() => {


          DatePickerDialog.show ({
            start: new Date ('2020-10-24') ,
            end: new Date ('2045-12-25') ,
            backgroundColor: Color.Pink ,
            backgroundBlurStyle: BlurStyle.Thin ,
            //当前选择的日期
            selected: this.selectedData ,
            // 是否展示时间项:
            // 为true:7月24日 下午 06:13
            // 为false:2024年7月24日
            showTime: true ,
            //展示时间是否为24小时制,useMilitaryTime跟showTime:true一起使用
            useMilitaryTime: false ,
            //是否展示农历
            lunarSwitch: true ,
            //设置所有选项中最上和最下两个选项的文本颜色、字号，字体粗细
            disappearTextStyle: { color: Color.Brown , font: { size: 20 , weight: FontWeight.Bold } } ,
            //设置当前选中的选项的文本颜色、字号，字体粗细
            selectedTextStyle: { color: Color.Orange , font: { size: 20 , weight: FontWeight.Bold } } ,
            //设置所有选项中间的选项的文本颜色、字号，字体粗细
            textStyle: { color: Color.White , font: { size: 20 , weight: FontWeight.Bold } } ,
            acceptButtonStyle: {} ,
            cancelButtonStyle: {} ,


          })
        })
      Button('时间滑动选择TimePickerDialog')
        .onClick(() => {
          TimePickerDialog.show({
            selected: this.selectTime,
            backgroundColor: Color.White,
            backgroundBlurStyle: BlurStyle.Thin,
            disappearTextStyle: { color: Color.Gray , font: { size: 20 , weight: FontWeight.Bold } } ,
            selectedTextStyle: { color: Color.Orange , font: { size: 20 , weight: FontWeight.Bold } } ,
            textStyle: { color: Color.Red , font: { size: 20 , weight: FontWeight.Bold } } ,
            //是否展示时间是否为24小时制,useMilitaryTime跟showTime:true一起使用
            useMilitaryTime: false,
            onAccept: (value: TimePickerResult) => {
              console.info ('index' + JSON.stringify (value))
              promptAction.showToast ({ message: '触发：onAccept' })

            } ,


          })
        })
      Button ('文本滑动选择' + this.v)
        .onClick (() => {
          TextPickerDialog.show ({
            range: this.fruits ,
            selected: this.select ,
            disappearTextStyle: { color: Color.Red , font: { size: 20 , weight: FontWeight.Bold } } ,
            selectedTextStyle: { color: Color.Blue , font: { size: 20 , weight: FontWeight.Bold } } ,
            textStyle: { color: Color.White , font: { size: 20 , weight: FontWeight.Bold } } ,
            onAccept: (value: TextPickerResult) => {
              console.info ('index' + JSON.stringify (value))
              this.select = value.index
              promptAction.showToast ({ message: '触发：onAccept' })
            } ,

          })
        })
    }
  }
}