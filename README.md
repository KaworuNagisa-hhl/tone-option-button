# tone-option-button

`tone-option-button` 是一个 OpenHarmony/HarmonyOS ArkUI like-ios 色调选择按钮组件，适合设置页主题选择、品牌色切换和个性化配置。默认展示黑色优先的色板、标题、副标题和选中圆点，保持纯色毛玻璃底；业务方可自定义宽高、填充色、叠色、边框、圆角、内边距和字号。

## 实际运行效果

下面展示色调按钮、色板和选中状态变化：

![tone option button preview](https://cdn.jsdelivr.net/gh/KaworuNagisa-hhl/tone-option-button@main/docs/tone-option-button-preview.gif)

## 安装

```bash
ohpm install tone-option-button
```

本地源码依赖：

```json5
{
  "dependencies": {
    "tone-option-button": "file:../tone-option-button",
    "theme": "file:../theme"
  }
}
```

## 正常使用样式

```ts
import { SwiftUIToneOptionButton } from 'tone-option-button'
import { SwiftUITone } from 'theme'

@Component
struct SettingsToneRow {
  @State selectedTone: SwiftUITone = SwiftUITone.GlassBlack

  build() {
    SwiftUIToneOptionButton({
      tone: SwiftUITone.GlassBlack,
      selectedTone: this.selectedTone,
      onSelect: (tone: SwiftUITone) => {
        this.selectedTone = tone
      }
    })
  }
}
```

## 自定义品牌样式

```ts
SwiftUIToneOptionButton({
  tone: SwiftUITone.GlassBlack,
  selectedTone: this.selectedTone,
  componentWidth: '100%',
  componentHeight: 80,
  fillColor: '#E6111111',
  tintColor: '#1FFFFFFF',
  customBorderColor: '#33FFFFFF',
  customBorderWidth: 1,
  cornerRadius: 8,
  contentPadding: 12,
  titleFontSize: 13,
  subtitleFontSize: 11,
  onSelect: (tone: SwiftUITone) => {
    this.selectedTone = tone
  }
})
```

## API

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| `tone` | `SwiftUITone` | `GlassBlack` | 当前按钮代表的色调 |
| `selectedTone` | `SwiftUITone` | `GlassBlack` | 当前已选色调 |
| `componentWidth` | `Length` | `'100%'` | 按钮宽度 |
| `componentHeight` | `Length` | `72` | 按钮高度 |
| `fillColor` | `ResourceColor` | `'#E6111111'` | 黑色毛玻璃底色 |
| `tintColor` | `ResourceColor` | 自动色调 | 渐变叠色 |
| `customBorderColor` | `ResourceColor` | 自动边框 | 自定义边框色 |
| `customBorderWidth` | `number` | `1` | 边框宽度 |
| `cornerRadius` | `number` | `12` | 圆角 |
| `contentPadding` | `number` | `8` | 内容内边距 |
| `titleFontSize` | `number` | `12` | 标题字号 |
| `subtitleFontSize` | `number` | `11` | 副标题字号 |
| `onSelect` | `(tone: SwiftUITone) => void` | 空函数 | 选择回调 |
