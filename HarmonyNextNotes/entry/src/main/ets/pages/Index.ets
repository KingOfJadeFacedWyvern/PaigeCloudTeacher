import { common , Want } from '@kit.AbilityKit';

@Entry
@Component
struct Index {
  context = getContext (this) as common.UIAbilityContext
  @State message: string = 'Hello World';
  @State handlePopup: boolean = false

  build () {
    Column () {
      Text (this.message)
        .fontSize (50)
        .fontWeight (FontWeight.Bold)
      Button ('UIAbility单实例跳转').onClick ((event: ClickEvent) => {
        let want:Want={
          deviceId: '' ,//设备ID，当前设备为空时候，代表就是当前设备。如果指定了则跳转的目标是指定设备的ID
          bundleName: "com.gdnd.myapplication" , //应用的标识，AppScope下面app.json5下面 "app"有一个 "bundleName": "",
          abilityName: 'MyEntryAbilityDemo' , // 启动指定的Ability的名称
          parameters: {
            info: '我是参数'
          }
        }
        this.context.startAbility (want)
      })

    }
    .height ('100%')
    .width ('100%')
  }
}
class User {
  name: string
  age: number
  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }


}