// 定义城市类型类
export class CityType {
  name: string;
  city: string[];

  constructor(name: string, city: string[]) {
    this.name = name;
    this.city = city;
  }
}

// 定义关键字城市类
export class cityGroup {
  name: string;
  city: string[];

  constructor(name: string, city: string[]) {
    this.name = name;
    this.city = city;
  }
}

// 城市列表数据
export const CITY_DATA = [
  new CityType('A', ['阿尔山', '阿勒泰地区', '安庆', '安阳']),
  new CityType('B', ['北京', '亳州', '包头', '宝鸡']),
  new CityType('C', ['重庆', '长春', '长沙', '成都']),
  new CityType('F', ['福州', '阜阳', '佛山', '抚顺']),
  new CityType('G', ['广州', '桂林', '赣州', '高雄']),
  new CityType('H', ['哈尔滨', '合肥', '杭州', '呼和浩特', '鹤岗', '呼兰']),
  new CityType('J', ['济南', '九江', '佳木斯']),
  new CityType('L', ['兰州', '丽江', '洛阳',]),
  new CityType('N', ['南昌', '南京', '宁波']),
  new CityType('Q', ['青岛', '七台河', '秦皇岛']),
  new CityType('S', ['上海', '沈阳', '石家庄', '三亚', '双鸭山', '深圳', '苏州']),
  new CityType('T', ['天津', '太原', '吐鲁番', '台北', '台湾', "唐山"]),
  new CityType('W', ['武汉', '文昌', '温岭', '温州', '芜湖']),
  new CityType('X', ['西安', '咸阳', '信阳', '厦门', '香港', '响水', '湘西']),
  new CityType('Y', ['银川', '延吉', '宜昌', '延边', '扬州', '烟台']),
  new CityType('Z',
    ['郑州', '珠海', '张家口', '张家界', '镇江', '中山', '枣阳', '枣庄', '漳州', '枝江', '芷江', '织金', '中牟', '中卫',
      '周口', '舟山', '庄河', '珠海'])
];

// 国内热门城市数据
export const HOT_CITY =
  ['北京', '上海', '广州', '深圳', '杭州', '南京', '苏州', '天津', '武汉', '长沙', '重庆', '成都'];

// AlphabetIndexer字母索引条数据
export const TAB_VALUE = ['A', 'B', 'C', 'F', 'G', 'H', 'J', 'L', 'N', 'Q', 'S', 'T', 'W', 'X', 'Y', 'Z'];