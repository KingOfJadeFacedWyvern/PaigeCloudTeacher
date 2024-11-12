import { BuilderNode , FrameNode , NodeController , UIContext } from '@kit.ArkUI';
class Params {
  text:string='这是一个button'
}
//要注意一般工具类里面不要放Builder
@Builder function buttonBuilder (params:Params) {
  Column () {
    Button(params.text)
      .fontSize(20)
      .borderRadius(11)
      .borderWidth(5)
      .backgroundColor (Color.Orange)

  }

}
export class MyNodeControlled extends NodeController {
  // 创建一个ButtonNode
  buttonNode: BuilderNode<[Params]>|null = null;
  constructor () {
    super ();
  }
  //默认创建节点调用的方法。在工具类中无法获取到UIContext，必须要在UI页面中使用才能创建
  makeNode (uiContext: UIContext): FrameNode | null {
    if (this.buttonNode != null) {
      return this.buttonNode.getFrameNode()
    }

    return null//没有这个节点
  }
  init (uiContext: UIContext){
    if (this.buttonNode != null) {
      return
    }
    this.buttonNode=new BuilderNode<[Params]>(uiContext)//UIContext创建一个BuilderNode，创建出组件节点
    this.buttonNode.build(wrapBuilder(buttonBuilder),{text:'这是一个button'})
  }
}
let myNode:MyNodeControlled|undefined
export const CreateMyNode=(uiContext: UIContext)=>{
  myNode=new MyNodeControlled()
  myNode.init(uiContext)
  return myNode
}