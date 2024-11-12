import worker , { MessageEvents } from '@ohos.worker'

@Entry
@Component
struct WorkerPage {
  workerInstance:worker.ThreadWorker=new worker.ThreadWorker('entry/ets/workers/Worker.ets')
  aboutToAppear(): void {
  //   主线程接收子线程完成时间的消息
    this.workerInstance.onmessage=((event:MessageEvents)=>{
      console.info ('MyWorker:')
      if (event.data.value=='处理成功了') {
        console.log ('子线程处理成功了进行下一下操作')
      }
    })
  }

  build () {
    Column () {
      Button ('主线程发送消息').onClick (() => {
        this.workerInstance.postMessage({'type':0})
      })
    }
  }
}