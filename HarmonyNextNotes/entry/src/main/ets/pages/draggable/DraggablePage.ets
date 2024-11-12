import { componentSnapshot } from '@kit.ArkUI'
import { image } from '@kit.ImageKit'
import { unifiedDataChannel , uniformTypeDescriptor } from '@kit.ArkData'

@Entry
@Component
struct DraggablePage {
  @State pixelMap: PixelMap | undefined = undefined
  @State images: string[] = []
  @State Assembly_visibility: Visibility = Visibility.Visible

  build () {
    Column ({ space: 20 }) {
      Text ('拖放文件')/*
         * 1.要加上draggable和onDragStart才具备拖拽功能
         * 2.默认拖拽出来的图形为元素截图
         * */
        .draggable (true)
        .onDragStart (() => {

        })
      // 对于图片拖动来说Draggable设置后就可以生效
      Image ($r ('app.media.Ocean'))
        .width (100)
        .aspectRatio (1)
        .draggable (true)
      Image ($r ('app.media.Aquavisin'))
        .width (100)
        .aspectRatio (1)
        .draggable (true)// 拖拽之前预先加载图片
        .onPreDrag ((status: PreDragStatus) => {
          if (PreDragStatus.ACTION_DETECTING_STATUS == status) {
            this.getCompImage ()

          }
        })
        .onDragStart (() => {
          let dragItemInfo: DragItemInfo = {
            pixelMap: this.pixelMap ,
            extraInfo: '1024' ,

          }
          return dragItemInfo
        })
      Divider ().margin ({ top: 10 , bottom: 10 })
      Image ($r ('app.media.startIcon'))
        .width (100)
        .aspectRatio (1)
        .draggable (true)
        .visibility(this.Assembly_visibility)
        //监听拖拽的元素是否释放
      .onDragEnd ((event: DragEvent) => { //还有一个参数extraParams: string
       let flag= event.getResult()
        if (flag == DragResult.DRAG_SUCCESSFUL) {
          this.Assembly_visibility=Visibility.Hidden

        } else {
          this.Assembly_visibility=Visibility.Visible

        }
      })
      Row () {
        List () {
          ForEach (this.images , (item: string) => {
            ListItem () {
              Image (item)
                .width (100)
                .aspectRatio (1)
            }
          })
        }
      }
      .width ('100%')
      .height (200)
      .border ({ width: 1 })
      //这里可以限制可放的类型，可以出现右上的小图标
      .allowDrop([uniformTypeDescriptor.UniformDataType.IMAGE])
      //释放的时候触发
      .onDrop ((event: DragEvent , extraParams: string) => {
        // 获取移动数据
        let unifiedData: UnifiedData = event.getData ()
        // 获取移动数据记录 这里面取得的就是数据对象中所有的相关数据
        let unifiedRecords: Array<unifiedDataChannel.UnifiedRecord> = unifiedData.getRecords ()
        // 这里是获取图片的地址
        let imgUri = (unifiedRecords[0] as unifiedDataChannel.Image).imageUri
        // insertIndex这个东西就是拖拽元素插入list的下标
        this.images.splice (JSON.parse (extraParams).insertIndex , 0 , imgUri)
      })
    }
    .width ('100%')
    .height ('100%')

  }

  // 生成嚣的方法是固定写法　↓
  @Builder
  builderImage () {
    Image ($r ('app.media.app_icon'))
      .width (200)
      .aspectRatio (1)

  }

  private getCompImage () {
    componentSnapshot.createFromBuilder (() => {
      this.builderImage ()
    } , (error: Error , pixelMap: image.PixelMap) => {
      if (error) {
        return
      }
      this.pixelMap = pixelMap
    })

  }

  //   生成嚣的方法是固定写法　↑
}