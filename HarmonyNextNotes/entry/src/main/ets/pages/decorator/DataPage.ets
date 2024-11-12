@Entry
@Component
struct DataPage {
  @State str:string = "123"
  build() {
    Column(){
      Text(this.str)
      TextInput({text:$$this.str})

    }
  }
}