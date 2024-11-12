@Entry
@ComponentV2
struct MonitorPage {
  @Local count: number = 0
  @Local countDemo: number = 10
  @Local str: string = '123'
  @Local demo: ClassDemo =new ClassDemo ('title')

  // @Monitor ('count')
  // changeCount (monitor: IMonitor) {
  //   // monitor.value<number> ()?.before是获取变化之前的值
  //   this.str = monitor.value<number> ()?.before + ""
  //   console.log (this.str)
  //   // monitor.value<number> ()?.now是获取变化当前的值
  //   this.str = monitor.value<number> ()?.now + ""
  //   console.log (this.str)
  //   // monitor.value<number> ()?.path是获取变化属性名
  //   this.str = monitor.value<number> ()?.path + ""
  //   console.log (this.str)
  //
  // }


  // 一个类里面同一个属性不要多次同时监听，会报错，如果说同一个属性多次监听了，这时候默认会只有最后一个监听方法生效
  // @Monitor ('')小括号中，可以放入的值是字符串的字面量或者说const常量、enum枚举值，不要用变量、变量的值、变量的属性、变量的属性的值等
  // @Monitor ('')小括号中只能放入一个不可更改的值，比如字符串字面量、枚举值、const常量等
  @Monitor ('count','countDemo')
  changeCount1 (monitor: IMonitor) {
    //  monitor.dirty可以获取到所有监听多个的属性名且改变的值
    //　monitor.value()如果小括号里面不指定path，并且监听多个变量，则默认获取是第一个变化
    // 如果说指定monitor.value(path)，则获取的是path指定的属性名的变化值
    monitor.dirty.forEach ((path) => {
      console.log (` ${path}+changeCount + ${monitor.value ()?.before} + ${monitor.value (path)?.now} `)

    })
  }
  /*
    * @Monitor ('demo.title')当监听数组或者是对象属性的时候，可以通过对象
    * 获取数组下标或者获取数组属性的方式点的方式，去监听
    * 数组监听:  @Monitor(数组.下标.下标.属性)
    * 对象监听:  @Monitor('demo.title')

   */
  @Monitor ('demo.title')
  changeDemo (monitor: IMonitor) {
    console.log (` changeDemoTitle + ${monitor.value ()?.before}  `)

  }

  build () {
    Column () {
      Text ('页面')
      Text (this.str)
      Text(this.demo.title)
      Button ('改变count' + this.count)
        .onClick (() => {
          this.count += 1
          this.countDemo += 1
          this.demo.title = '改变了对象的属性值'+this.count
          // this.demo= new ClassDemo ('改变了对象的属性值')
        })
    }
  }
}
@ObservedV2
class ClassDemo {
  @Trace title: string = 'title'

  constructor (title:string) {
    this.title = title
  }
}