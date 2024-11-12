import { taskpool } from '@kit.ArkTS'

@Entry
@Component
struct TaskPoolPage {
  runTask () {
    let task1:taskpool.Task = new taskpool.Task(printArgs,100)
    taskpool.execute(task1,taskpool.Priority.LOW).then((value:Object)=>{
      console.info ('taskpool result:'+value)
    })

  }

  build () {
    Column () {
      Button ('执行文件读写').onClick (() => {
        this.runTask()
      })
    }
  }
}

@Concurrent
async function printArgs (args:number,fun:Promise<string>) {
  console.info ('PrintArgs:'+args)
  return await fun
}
let task2:taskpool.Task=new taskpool.Task(printArgs,200)
let task3:taskpool.Task=new taskpool.Task(printArgs,300)
taskpool.execute(task2,taskpool.Priority.MEDIUM).then((value:Object)=>{
  console.info ('taskpool result2:'+value)

})
taskpool.execute(task3,taskpool.Priority.HIGH).then((value:Object)=>{
  console.info ('taskpool result3:'+value)

})