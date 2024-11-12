import { setLocalStorage , User } from './LocalStorageUti';

@Entry
@Component
struct LocalStoragePage {
  @State user: User = new User ('' , '' , '');

  build () {
    Column () {
      Button ('放入LocalStorage').onClick (() => {
        let storage = setLocalStorage (new User ('test' , '123456' , '12345678901'))
        this.user.userName = storage.prop ('userName').get () as string
      })
      Text ('用户名称:' + this.user.userName)
      Text ('用户密码:' + this.user.password)
      Text ('用户手机号:' + this.user.mobile)
    }
  }
}