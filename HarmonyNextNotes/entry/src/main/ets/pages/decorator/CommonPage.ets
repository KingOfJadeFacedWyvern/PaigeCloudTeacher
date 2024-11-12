import { User } from './BuilderPage'

@Entry
@Component
struct CommonPage {
  build() {
  }
}

//全局的函数名开头可以大写
@Builder
function CommonBuilder(user: User) {
  Column() {
    Text("全局的builder函数")
    Text(user.title)
  }
}

@Builder
function CommonBuilder2(user: User) {
  Column() {
    Text("全局的builder函数")
    Text(user.title)
  }
}

//全局作用
const globalBuilder: WrappedBuilder<[User]>[] = [wrapBuilder(CommonBuilder), wrapBuilder(CommonBuilder2)]

export default globalBuilder
