export function setLocalStorage(user: User) {
  let storage = new LocalStorage(user);
  return storage
}
export class User {
  userName: string;
  password: string;
  mobile: string;
  constructor(userName: string, password: string, mobile: string) {
    this.userName = userName;
    this.password = password;
    this.mobile = mobile;
  }

}