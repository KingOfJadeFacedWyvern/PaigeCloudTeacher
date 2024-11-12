import { AbilityConstant , AbilityStage , Configuration , Want } from '@kit.AbilityKit';
//想要监听还要配置module.json5下面module添加srcEntry:当前路径
export default class MyAbilityStage extends AbilityStage{
  //   在开始进行初始化的能力阶段时回调其实创建AbilityStage
  onCreate(): void {

    console.log('创建AbilityStage');
  }
  // 启动指定能力时回调：仅仅是在UIAbility，Specified这种模式下触发，返回UIAbility通过Want启动的标识，相当于给启动的Ability添加一个标识
  onAcceptWant(want: Want): string {
    if (want.abilityName=='SpecifiedEntryAbility') {
      if (want.parameters) {
        return `SpecifiedAbilityInstance_${want.parameters.instanceKey}`
      }

    }
    return "onAcceptWant";
  }
  // 在指定进程中启动 UIAbility 时回调。在这里可以返回自定义　的进程标识符
  onNewProcessRequest(want: Want): string {
    return "onNewProcessRequest";

  }
  // 在更新系统配置时调用,
  onConfigurationUpdate(newConfig: Configuration): void {
    console.log('onConfigurationUpdate');
  }
  // 当系统已确定修剪内存时调用，例如ample，当能力在
  // 后台，并且没有足够的内存来运行尽可能多的后台进程。
  // 当系统内存变化的时候监听回调，处理内存相关事件
  onMemoryLevel(level: AbilityConstant.MemoryLevel): void {
    console.log('onMemoryLevel');
  }
  //当技能阶段被摧毁时回调。
  //当杀死进程或异常崩溃时，不会调用 onDestroy 函数。

  onDestroy(): void {
    console.log('onDestroy');
  }

}