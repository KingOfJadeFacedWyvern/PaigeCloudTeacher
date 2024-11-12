import { promptAction } from '@kit.ArkUI'

export class MyButtonModifier implements AttributeModifier<ButtonAttribute> {
  flag: number = 0

  constructor(flag: number) {
    this.flag = flag
  }

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.fontColor(Color.Pink)
      .type(ButtonType.Circle)
      .onClick(() => {
        promptAction.showToast({ message: "12312" })
      })
  }

  applyPressedAttribute(instance: ButtonAttribute): void {
    instance.fontColor(Color.Pink)
      .type(ButtonType.Circle)
  }

  applyFocusedAttribute(instance: ButtonAttribute): void {
  }

  applySelectedAttribute(instance: ButtonAttribute): void {
  }

  applyDisabledAttribute(instance: ButtonAttribute): void {
  }
}