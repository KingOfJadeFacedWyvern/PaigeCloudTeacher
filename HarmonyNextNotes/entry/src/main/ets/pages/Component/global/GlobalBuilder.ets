@Builder function CommonBuilder() {
  Column () {
    Text('玉面飞龙之王')
  }
}
const globalBuilder:WrappedBuilder<[]>=wrapBuilder(CommonBuilder)

export default globalBuilder


