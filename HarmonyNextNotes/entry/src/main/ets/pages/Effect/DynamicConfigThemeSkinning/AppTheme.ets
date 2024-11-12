import { CustomColors , CustomTheme } from '@kit.ArkUI';
class AppColors implements CustomColors {
  brand: ResourceColor=Color.Orange;
}
class AppTheme implements CustomTheme {
  public colors: AppColors= new AppColors();
}
export let appTheme = new AppTheme();