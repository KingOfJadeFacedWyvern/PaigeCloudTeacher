import { common , Want } from '@kit.AbilityKit'
interface ModelContactInfo {
  contactName: string;
  telephone: string;
}
//这个代码有华为手机和HarmonyOS才能测试
@Entry
@Component
struct MmsPage {
startMmsAbility () {
  const context=getContext(this) as common.UIAbilityContext
  let contactInfo:Array<ModelContactInfo> =[{
    contactName: '张三',
    telephone: '12345678901'
  }]
  let want:Want ={
    bundleName: 'com.example.mms',
    abilityName: 'com.example.mms.MainAbility',
    parameters: {
      contact: JSON.stringify(contactInfo),
      pageFlag: 'conversation'//页面谈话，相当于给他新增一条联系方式
    }
    // action: 'action.system.mms.main',
    // uri: 'mms://com.example.mms/com.example.mms.MainAbility',
    // type: 'page',
    // entities: ['entity.system.mms'],
  }
  context.startAbility(want)

}
  build () {
    Column () {
      Button ('拉直短信页面并指定联系人').onClick ((event: ClickEvent) => {
        　this.startMmsAbility()
      })
    }
  }
}