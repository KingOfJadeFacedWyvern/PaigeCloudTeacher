import { AbilityConstant  , UIAbility , Want,Configuration } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { preferencesUtil } from '../pages/preference/PreferencesUtil';
import { kvDatabase } from '../pages/preference/kvDatabase/KVDatabase';
import dbUtil from '../common/db/DbUtilities';

export default class EntryAbility extends UIAbility {
  onCreate (want: Want , launchParam: AbilityConstant.LaunchParam): void {
    hilog.info (0x0000 , 'testTag' , '%{public}s' , 'Ability onCreate');
    console.log (this.context.config.colorMode?.toString()+'龙飞')
    AppStorage.setOrCreate('myContext',this.context)
    //这里错了
    preferencesUtil.init()
    // PreferenceUtilities.init()
    kvDatabase.initKVData()

    dbUtil.initDb()


  }

  onDestroy (): void {
    hilog.info (0x0000 , 'testTag' , '%{public}s' , 'Ability onDestroy');
  }

  onWindowStageCreate (windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info (0x0000 , 'testTag' , '%{public}s' , 'Ability onWindowStageCreate');
    //页面引用错了
    windowStage.loadContent ("pages/webSocket/WebSocketPage" , (err) => {
      if (err.code) {
        hilog.error (0x0000 , 'testTag' , 'Failed to load the content. Cause: %{public}s' , JSON.stringify (err) ?? '');

      }
      hilog.info (0x0000 , 'testTag' , 'Succeeded in loading the content.');
    });
    let mainWindowClass: window.Window =windowStage.getMainWindowSync()// 获取主窗口
    // mainWindowClass.setWindowLayoutFullScreen(true)// 设置全屏
    let type=window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR// 获取导航栏区域
    let avoidArea=mainWindowClass.getWindowAvoidArea(type)// 获取窗口回避区域
    let bottomRectHeight= avoidArea.bottomRect.height// 获取下边导航栏区域高度
    let topRectHeight= avoidArea.bottomRect.top// 获取上边导航栏区域高度
    AppStorage.setOrCreate('bottomRectHeight',bottomRectHeight)
    // mainWindowClass.setSpecificSystemBarEnabled('status',false)// 上面的时间、充电状态，隐藏状态栏
    console.log ('bottomRectHeight:' + bottomRectHeight)
    console.log ('topRectHeight:' + topRectHeight)


  }

  onWindowStageDestroy (): void {
    // Main window is destroyed, release UI related resources
    hilog.info (0x0000 , 'testTag' , '%{public}s' , 'Ability onWindowStageDestroy');
  }

  onForeground (): void {
    // Ability has brought to foreground
    hilog.info (0x0000 , 'testTag' , '%{public}s' , 'Ability onForeground');
  }

  onBackground (): void {
    // Ability has back to background
    hilog.info (0x0000 , 'testTag' , '%{public}s' , 'Ability onBackground');
  }
  // 动态监听系统配置后相关的配置项，监听深色模式和浅色模式
  onConfigurationUpdate(newConfig: Configuration): void {
    console.log (newConfig.colorMode?.toString()+'龙飞1')

  }
}
