@Entry
@Component
struct PracticeDemo {
  build () {
    GridRow () {
      GridCol ({ span: {sm:12}}) {
        GridRow() {
          GridCol ({ span: {sm:2}}) {
            Row() {
              Text('left')
            }
            .height('90%')
          }.backgroundColor (Color.Orange)
          GridCol ({ span: {sm:10}}) {
            Row() {
              Text('right')
            }
            .height('90%')
          }.backgroundColor (Color.Blue)
        }
      }
      GridCol ({ span: {sm:12}}) {
        Row () {
          Text('footer')
          
        }
      }.backgroundColor (Color.Pink)
    }.height (845)
  }
}
