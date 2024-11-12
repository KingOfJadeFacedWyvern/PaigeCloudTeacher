import CityList from './CityList'
import HotCity from './HotCity'

@Entry
@Component
struct DemoIndex {
  build () {
    Column () {
      Search ({ placeholder: '请输入城市名称' })
        .searchButton ('搜索')
      HotCity ()
      CityList()
    }
    .padding ({ left: 10 , right: 10 })
    .width ('100%')
    .height ('100%')

  }
}