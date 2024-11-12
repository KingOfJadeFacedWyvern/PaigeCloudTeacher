import dbUtil from './DbUtilities'

@Entry
@Component
struct DbPage {

  build () {
    Column () {
      Button ('添加数据').onClick ((event: ClickEvent) => {
        dbUtil.insert()
      })
      Button ('更新数据').onClick ((event: ClickEvent) => {
        dbUtil.update()
      })
      Button ('删除数据').onClick ((event: ClickEvent) => {
        dbUtil.delete()
      })
      Button ('查询数据').onClick ((event: ClickEvent) => {
        dbUtil.query()
      })

    }
  }
}