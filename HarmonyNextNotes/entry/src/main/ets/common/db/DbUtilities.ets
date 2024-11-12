import { relationalStore } from '@kit.ArkData'
import { common } from '@kit.AbilityKit'
// 这一节主要学习关系型数据库呢，主要基于sqlite组件啊，适用于存储包含复杂，关系类型的一些场景啊。
class DbUtilities {
  constructor () {

  }


  store: relationalStore.RdbStore = {} as relationalStore.RdbStore//数据库对象

  //初始化数据库,存储手机系统应用内的database文件夹下的沙箱文件中
  initDb () {
    //第一步获取上下文
    let context = AppStorage.get ("myContext") as common.UIAbilityContext
    // 是一个配置项
    let storeConfig: relationalStore.StoreConfig = {
      name: 'test.db' ,//数据库名称
      securityLevel: relationalStore.SecurityLevel.S1 ,//安全级别
      encrypt: false ,//是否加密
      isReadOnly: false//是否只读


    }
    /*
     * 第二步通过relationalStore.getRdbStore获取store控制对象
     *          relationalStore是最关键，relationalStore是@kit.ArkDat里面必需要内容，必须要通过relationalStore去点getRdbStore，获取这个Store对象了就必须要通过getRdbStore
     *                            第一参数：上下文
     *                            第二参数：配置项
     *                            第三参数：没有异步的话，提供回调方法
     *
     * */
    relationalStore.getRdbStore (context , storeConfig , (err , store) => {
      if (err) {
        console.log ("数据库连接失败，无法获取Store")
        return
      } else {
        this.store = store
        this.initSql ()//初始化表
      }
    })
  }
  // 创建表
  initSql () {
    let sql = "CREATE TABLE IF NOT EXISTS \"user\" (\n" +
      "  \"userID\" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,\n" +
      "  \"username\" TEXT,\n" +
      "  \"password\" TEXT\n" +
      ");\n"
    this.store.executeSql (sql)//执行sql语句
  }

  //username: string , password: string
  insert () {
    // 这是一个构建数据对象
    const valueBucket: relationalStore.ValuesBucket = {
      Username: 'Dragon3' ,
      Password: '123456'
    }
    try {
      let rowId = this.store.insertSync ("user" , valueBucket)
      console.log ("插入条数:" + rowId)
      return rowId
    } catch (e) {
      return -1
    }
  }

  update () {
    const valueBucket: relationalStore.ValuesBucket = {
      Username: 'Dragon3' ,
      Password: '123456'
    }
    try {
      let predicates = new relationalStore.RdbPredicates ("user")
      predicates.equalTo ('username' , 'Dragon5')//条件匹配
      let rowId = this.store.updateSync (valueBucket , predicates)
      console.log ('更新条数：' + rowId)
      return rowId
    } catch (e) {
      return -1
    }
  }

  delete () {
    try {
      let predicates = new relationalStore.RdbPredicates ("user")
      // predicates.equalTo ('Username', 'Dragon5')
      let rows = this.store.deleteSync (predicates)
      console.log ('删除条数：' + rows)
      return rows
    } catch (e) {
      return -1
    }
  }

  query () {
    try {
      let predicates = new relationalStore.RdbPredicates ("user")
      // predicates.equalTo ('Username', 'Dragon5')
      let resultSet: relationalStore.ResultSet = this.store.querySync (predicates , [
        "userID",
        "username",
        "password"
      ])
      while (resultSet.goToNextRow ()) {
        const userID = resultSet.getLong (resultSet.getColumnIndex ("userID"))
        const username = resultSet.getLong (resultSet.getColumnIndex ("username"))
        const password = resultSet.getLong (resultSet.getColumnIndex ("password"))
        console.log (`用户ID: ${userID}，用户名：${username}，密码：${password}`)

      }
      resultSet.close ()

    } catch (e) {

    }
  }

  batchInsert () {
    const valueBucket: relationalStore.ValuesBucket[] = [
      {
        Username: 'Dragon' ,
        Password: '123456'
      },
      {
        Username: 'Dragon2' ,
        Password: '123456'
      },
      {
        Username: 'Dragon3' ,
        Password: '123456'
      },
    ]


    try {
      let rowId = this.store.batchInsertSync (
        "user" ,
        valueBucket
      )
      console.log ("批量插入条数:" + rowId)
      return rowId

    } catch (e) {
      return -1
    }
  }
}

let dbUtil: DbUtilities = new DbUtilities ()//数据库工具类

export default dbUtil//暴露给其他页面使用
//需要在EntryAbility里面进行初始化