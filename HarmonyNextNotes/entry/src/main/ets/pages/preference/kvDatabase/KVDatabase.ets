import { common } from '@kit.AbilityKit'
import { distributedKVStore } from '@kit.ArkData'
import { BusinessError } from '@kit.BasicServicesKit'

class KVDatabase {
  kvManager: distributedKVStore.KVManager | null = null
  keStore: distributedKVStore.SingleKVStore | undefined = undefined
    // 初始化数据库
    initKVData () {
    let context = AppStorage.get('myContext') as common.UIAbilityContext || getContext(this) as common.UIAbilityContext
    //   初始化KVManager实例，也就是说在这个distributedKVStore下面获取，必须要引入 '@kit.ArkData'，需要先创建一个管理器通过这个管理器去操作数据库的初始化
    const kvManagerConfig:distributedKVStore.KVManagerConfig={
      context: context,
      bundleName:  "com.gdnd.myapplication",//包名在APP　Scope下面app.json5里面"bundleName"
    }
      // 以下代码块用于初始化分布式键值存储管理器
      // 初始化分布式键值存储管理器，以便后续进行数据的存储与检索
   this.kvManager=distributedKVStore.createKVManager(kvManagerConfig)

    this.initKvStore()
  }
  // 初始化KVStore实例
  private initKvStore () {
    //这里面有几个属性
    const options:distributedKVStore.Options={
      createIfMissing: true,//当数据库文件不存在是否创建数据库
      encrypt: false,//数据库是否加密
      backup: false,//是否数据库备份
      autoSync: false,//是否自动同步跟是否跨设备同步
      /*
       * 　　　　　　　　　　　　　　　　这个最重要kvStoreType
       * 第一个叫做跨设备类型DEVICE_COLLABORATION
       * 第一个叫做单机的SINGLE_VERSION 单版本，只允许一个设备操作数据库，其他设备无法操作，但是可以跨设备同步
       * 不设置的话，默认DEVICE_COLLABORATION分布存储
       */
      kvStoreType: distributedKVStore.KVStoreType.DEVICE_COLLABORATION,
      // 安全等级S1到S4
      securityLevel: distributedKVStore.SecurityLevel.S4,

    }
    this.kvManager?.getKVStore<distributedKVStore.SingleKVStore>('storeId', options,(err, store: distributedKVStore.SingleKVStore)=>{
      if (err) {
        console.error ('获取kevStore失败')
        return
      }
      this.keStore=store

    })
  }
 async get (key: string) {
    try {
      return await this.keStore?.get(key)
    } catch (e) {
      e= e as BusinessError
      console.log (e.message)
      return null
    }
  }
  put (key: string, value: Uint8Array | string | number | boolean) {
    try {
      this.keStore?.put(key, value)
    } catch (e) {
      e= e as BusinessError
      console.log (e.message)
    }
  }
  delete (key: string) {
    try {
      this.keStore?.delete(key)
    } catch (e) {
      e= e as BusinessError
      console.log (e.message)
    }
  }
  deleteBatch (keys: string[]) {
    try {
      this.keStore?.deleteBatch(keys)
    } catch (e) {
      e= e as BusinessError
      console.log (e.message)
    }
  }
}
export const kvDatabase=new KVDatabase()