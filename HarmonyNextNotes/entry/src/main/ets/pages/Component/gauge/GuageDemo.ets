@Entry
@Component
struct GaugeDemo {
  color1: LinearGradient = new LinearGradient ([
    {
      color: Color.Red ,
      offset: 0
    },
    {
      color: Color.Yellow ,
      offset: 1
    },

  ])
  color2: LinearGradient = new LinearGradient ([
    {
      color: '#65EEC9A3' ,
      offset: 0
    },
    {
      color: '#FFEF629F' ,
      offset: 1
    }
  ])

  build () {
    Column () {
      //数据量规图表组件
      Gauge ({ value: 35 , max: 100 , min: 1 }) {
        Column () {
          Gauge ({ value: 35 , max: 110 , min: 1 })
            .width(240)
            // 起始角度
            .startAngle(225)
              // 结束角度
            .endAngle(135)
            .margin ({ top: 30})
              // 指示器
            .indicator(null)
          Text ('50')
            .fontWeight (FontWeight.Bold)
            .fontSize (35)
          Text ('文本')
            .fontWeight (FontWeight.Bold)
            .fontSize (35)

        }
      }
      // colors:这个里面是二维数组，数组第一个元素是颜色，第二个元素是渐变比例就是占的比重
      .colors([[this.color1,5],[this.color2,2]])
      // 线宽
      .strokeWidth(5)
      // 起始角度
      .startAngle(225)
      // 结束角度
      .endAngle(135)
      // 指示器
      .indicator(null)
    }
  }
}