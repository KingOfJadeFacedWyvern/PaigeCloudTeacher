import { preferences } from '@kit.ArkData'
import { common } from '@kit.AbilityKit'
import { BusinessError } from '@kit.BasicServicesKit'

class PreferencesUtil {
  //用户相关数据，APPStorage，也可以通过首选项，token用户登录的一个key的表示，表示用户身份的id
  static readonly preferencesName = 'myPreferences'
  dataPreferences: preferences.Preferences | null = null

  constructor() {
  }

  init() {
    if (this.dataPreferences != null) {
      return
    }
    //同步获取preferences实例
    /**
     * 1.通过参数形式获取,初始化的时候需要传过来
     * 2.APPStorage获取，需要在EntryAbility的时候，给他放进去
     * 3.getContext获取，在UIPage页面进行获取传输
     */
    let context = AppStorage.get('myContext') as common.UIAbilityContext || getContext(this) as common.UIAbilityContext
    this.dataPreferences = preferences.getPreferencesSync(context, { name: PreferencesUtil.preferencesName })
  }

  get(key: string) {
    try {
      return this.dataPreferences?.getSync(key, '')
    } catch (e) {
      e = e as BusinessError
      console.log(e.message)
      return null
    }
  }

  put(key: string, value: preferences.ValueType) {
    try {
      this.dataPreferences?.putSync(key, value)
      this.flush()
    } catch (e) {
      e = e as BusinessError
      console.log(e.message)
    }
  }

  delete(key: string) {
    try {
      this.dataPreferences?.deleteSync(key)
      this.flush()
    } catch (e) {
      e = e as BusinessError
      console.log(e.message)
    }
  }

  flush() {
    //持久化
    try {
      this.dataPreferences?.flush()
    } catch (e) {
      e = e as BusinessError
      console.log(e.message)
    }
  }
}

export const preferencesUtil = new PreferencesUtil()