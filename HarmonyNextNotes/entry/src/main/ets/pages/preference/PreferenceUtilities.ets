import { preferences } from '@kit.ArkData'
import { common } from '@kit.AbilityKit'
import { BusinessError } from '@kit.BasicServicesKit'
// 用户相关数据：APPStorage，也可以通过首选项，Token用户登陆的一个Key的表示，表示用户身份ID
class PreferenceUtilities {
  static readonly preferencesName = 'myPreferences'
  /*
   * 有两种获取方式
                 一种方式：dataPreference: preferences.Preferences | null = null 建议使用这种方式
                 另一种是通过  dataPreference: preferences.Preferences ={} as  preferences.Preferences 这种方式不太建议使用，因为还是有空对象

   */
  dataPreferences: preferences.Preferences | null = null
  constructor () {
    // this.init()
  }

  init () {
    if (this.dataPreferences != null) {
      return
    }
    //同步获取Preferences实例
    /*
     * 第一种情况：通过参数形式获取，不好点：初始化的时候需要传过来init(context:common.UIAbilityContext)　　　“建议使用”
     * 第二种情况：APPStorage获取，需要在EntryAbility的时候，给他放进去　AppStorage.setOrCreate('myContext',this.context) preferenceUtilities.init()　　“建议使用”
                 有两种获取方式：
                               * 1、通过AppStorage.get('myContext') as common.UIAbilityContext
                               * 2、通过getContext() as common.UIAbilityContext
     * 第三种情况：getContext获取，在UIPage页面进行传输，只适用不频繁的操作
     */
    let context = AppStorage.get ('myContext') as common.UIAbilityContext || getContext (this) as common.UIAbilityContext
    this.dataPreferences = preferences.getPreferencesSync (context , { name: PreferenceUtilities.preferencesName })
  }

  get (key: string) {
    try {
      return this.dataPreferences?.getSync (key , '')
    } catch (e) {
      e = e as BusinessError
      console.log (e.message)
      return null
    }
  }

  put (key: string , value: preferences.ValueType) {
    try {
      this.dataPreferences?.putSync (key , value)
      this.flush ()
    } catch (e) {
      e = e as BusinessError
      console.log (e.message)
    }
  }

  delete (key: string) {
    try {
      this.dataPreferences?.deleteSync (key)
      this.flush ()
    } catch (e) {
      e = e as BusinessError
      console.log (e.message)
    }
  }

  flush () {
    // 同步刷新，持久化到磁盘
    try {
      this.dataPreferences?.flush ()
    } catch (e) {
      e = e as BusinessError
      console.log (e.message)
    }
  }
}

export const preferenceUtilities = new PreferenceUtilities ()