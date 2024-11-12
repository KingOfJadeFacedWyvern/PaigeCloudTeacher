import { common , Want } from '@kit.AbilityKit';

@Entry
@Component
struct SpecifiedPage {
  context = getContext (this) as common.UIAbilityContext
  @State count: number = 0

  getInstanceKey () {
    this.count+=1
    return this.count+''

  }

  build () {
    Column ({ space: 20 }) {
      Button ('新建文件').onClick ((event: ClickEvent) => {
        let want: Want = {
          deviceId: '' , //设备ID，当前设备为空时候，代表就是当前设备。如果指定了则跳转的目标是指定设备的ID
          bundleName: "com.gdnd.myapplication" , //应用的标识，AppScope下面app.json5下面 "app"有一个 "bundleName": "",
          abilityName: 'SpecifiedEntryAbility' , // 启动指定的Ability的名称
          parameters: {
            info: '我是参数' ,
            page:"pages/ability/NewFilePage",
            instanceKey:this.getInstanceKey()
          }
        }
        this.context.startAbility (want)

      })
      Button ('打开已经保存的文件').onClick ((event: ClickEvent) => {
        let want: Want = {
          deviceId: '' , //设备ID，当前设备为空时候，代表就是当前设备。如果指定了则跳转的目标是指定设备的ID
          bundleName: "com.gdnd.myapplication" , //应用的标识，AppScope下面app.json5下面 "app"有一个 "bundleName": "",
          abilityName: 'SpecifiedEntryAbility' , // 启动指定的Ability的名称
          parameters: {
            info: '我是参数' ,
            page:"pages/ability/OldPage",
            instanceKey:'key'
          }
        }
        this.context.startAbility (want)

      })
    }
    .width ('100%')
    .height ('100%')
  }
}