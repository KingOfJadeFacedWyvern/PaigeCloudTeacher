@Entry
@ComponentV2
struct ComputedPage {
  @Local firstName: string = 'Li'
  @Local lastName: string = 'Hua'

  /*
   *                计算属性
   * @Computed: 如果返回值和属性没有变化，则值为加载一次，不会重新计算
   * @Computed: 如果返回值和属性有变化，则每次都会重新计算
   * @Computed: 如果说比较简单的这种计算可以不使用计算属性，直接使用属性即可
   * @Computed: 如果说计算属性的计算比较复杂，可以使用计算属性
   * @Computed: 如果说在视图中只使用了一次，也可以不使用计算属性
   */
  @Computed
  get fullName () {
    return this.firstName + ' ' + this.lastName
  }
  build () {
    Column () {
      Text('计算属性')
        .fontSize(50)
        .fontColor(Color.Red)

      Text(this.lastName +'' + this.firstName)
        .fontSize(50)
        .fontColor(Color.Red)
        .textOverflow({ overflow: TextOverflow.MARQUEE})
        .maxLines(1)
      Text(this.fullName)
        .fontSize(50)
        .fontColor(Color.Red)
      Text(this.fullName)
        .fontSize(50)
        .fontColor(Color.Red)
      Button('Change　Full Name')
        .fontSize(25)
       .onClick(() => {
           this.firstName += 'a'
       })


    }
  }
}