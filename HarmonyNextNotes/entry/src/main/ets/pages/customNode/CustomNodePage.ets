import { CreateMyNode , MyNodeControlled } from './CustomNodeButton'

@Entry
@Component
struct CustomNodePage {
myNodeController:MyNodeControlled=CreateMyNode(this.getUIContext())
  build () {
    Column () {
      NodeContainer(this.myNodeController)
    }
  }
}