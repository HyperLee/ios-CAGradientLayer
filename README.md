# iOS CAGradientLayer 演示專案

一個用於學習和練習 iOS `CAGradientLayer` API 的示範應用程式，展示多色漸層效果和動畫轉換。

## 專案概述

本專案是一個簡單而功能完整的 iOS 應用程式，專門用於展示 Core Animation 框架中 `CAGradientLayer` 的使用方法。透過這個應用程式，您可以學習如何：

- 創建和配置 CAGradientLayer
- 實現多組顏色漸層效果
- 使用 CABasicAnimation 實現平滑的顏色轉換動畫
- 處理手勢識別和動畫回調

## 功能特色

### 🎨 多色漸層效果
- **預設顏色組合**：應用程式包含四組預定義的漸層顏色組合
  - 紅色 → 黃色漸層
  - 綠色 → 洋紅色漸層
  - 灰色 → 淺灰色漸層
  - 藍色 → 棕色漸層

### 🔄 動畫轉換
- **平滑動畫**：使用 `CABasicAnimation` 實現 2 秒的平滑顏色轉換
- **循環切換**：點擊螢幕可循環切換不同的漸層色彩組合
- **動畫控制**：包含完整的動畫生命週期管理

### 📱 互動體驗
- **手勢識別**：支援點擊手勢來觸發顏色切換
- **全螢幕效果**：漸層效果覆蓋整個螢幕視圖
- **即時預覽**：動畫效果即時呈現，無延遲

## 技術實現

### CAGradientLayer 配置

```swift
func createGradientLayer(){
    gradientLayer = CAGradientLayer()
    gradientLayer.frame = self.view.bounds
    gradientLayer.colors = colorSets[currentColorSet]
    self.view.layer.addSublayer(gradientLayer)
}
```

### 顏色組合設定

```swift
func createColorSets() {
    colorSets.append([UIColor.redColor().CGColor, UIColor.yellowColor().CGColor])
    colorSets.append([UIColor.greenColor().CGColor, UIColor.magentaColor().CGColor])
    colorSets.append([UIColor.grayColor().CGColor, UIColor.lightGrayColor().CGColor])
    colorSets.append([UIColor.blueColor().CGColor, UIColor.brownColor().CGColor])
    currentColorSet = 0
}
```

### 動畫實現

```swift
let colorChangeAnimation = CABasicAnimation(keyPath: "colors")
colorChangeAnimation.duration = 2.0
colorChangeAnimation.toValue = colorSets[currentColorSet]
colorChangeAnimation.fillMode = kCAFillModeForwards
colorChangeAnimation.removedOnCompletion = false
colorChangeAnimation.delegate = self
gradientLayer.addAnimation(colorChangeAnimation, forKey: "colorChange")
```

## CABasicAnimation 屬性詳解

本專案中使用的動畫屬性及其說明：

| 屬性 | 說明 |
|------|------|
| `duration` | 動畫時長（秒為單位） |
| `repeatCount` | 重複次數。永久重複設置為 `HUGE_VALF` |
| `beginTime` | 指定動畫開始時間。延遲執行可設置為 `CACurrentMediaTime() + 秒數` |
| `timingFunction` | 設定動畫的速度變化曲線 |
| `autoreverses` | 動畫結束時是否執行逆向動畫 |
| `fromValue` | 動畫開始值 |
| `toValue` | 動畫結束值（絕對值） |
| `byValue` | 動畫結束值（相對值） |
| `fillMode` | 動畫填充模式 |
| `removedOnCompletion` | 動畫完成後是否移除 |

## 專案結構

```
CAGradientLayer/
├── CAGradientLayer/
│   ├── AppDelegate.swift          # 應用程式委託
│   ├── ViewController.swift       # 主視圖控制器
│   ├── Assets.xcassets           # 資源文件
│   ├── Base.lproj/               # 本地化資源
│   └── Info.plist                # 應用程式配置
├── CAGradientLayerTests/         # 單元測試
├── CAGradientLayerUITests/       # UI 測試
└── CAGradientLayer.xcodeproj     # Xcode 專案文件
```

### 核心文件說明

#### ViewController.swift
主要的視圖控制器，包含以下核心功能：
- `gradientLayer`: CAGradientLayer 實例
- `colorSets`: 存儲多組顏色組合的陣列
- `currentColorSet`: 當前顏色組合的索引
- `createGradientLayer()`: 創建和配置漸層圖層
- `createColorSets()`: 初始化顏色組合
- `handleTapGesture()`: 處理點擊手勢並觸發動畫
- `animationDidStop()`: 動畫完成回調

## 系統需求

- **iOS 版本**: iOS 9.0+
- **Xcode 版本**: Xcode 8.0+
- **Swift 版本**: Swift 3.0+
- **設備支援**: iPhone, iPad
- **方向支援**: Portrait, Landscape Left, Landscape Right

## 安裝和運行

### 1. 環境準備
確保您的開發環境滿足以下要求：
- macOS 系統
- 已安裝 Xcode
- iOS 模擬器或真實 iOS 設備

### 2. 下載專案
```bash
git clone https://github.com/HyperLee/ios-CAGradientLayer.git
cd ios-CAGradientLayer
```

### 3. 打開專案
```bash
open CAGradientLayer/CAGradientLayer.xcodeproj
```

### 4. 編譯和運行
1. 在 Xcode 中選擇目標設備（模擬器或真實設備）
2. 按 `Cmd + R` 編譯並運行專案
3. 應用程式將顯示第一個漸層效果
4. 點擊螢幕任意位置可切換到下一個顏色組合

## 使用方法

1. **啟動應用程式**：應用程式啟動後會顯示紅色到黃色的漸層背景
2. **切換顏色**：點擊螢幕任意位置可觸發顏色切換動畫
3. **觀察動畫**：每次切換都會有 2 秒的平滑過渡動畫
4. **循環播放**：四組顏色會循環切換，到達最後一組後會回到第一組

## 學習要點

### 1. CAGradientLayer 基礎
- 理解 CAGradientLayer 的工作原理
- 學習如何設置漸層顏色和方向
- 掌握圖層的框架設置和添加方法

### 2. Core Animation 動畫
- 學習 CABasicAnimation 的使用方法
- 理解動畫屬性的配置和控制
- 掌握動畫委託模式的實現

### 3. 手勢識別
- 學習 UITapGestureRecognizer 的使用
- 理解手勢識別器的添加和處理方法

### 4. 動畫生命週期
- 理解動畫的開始、進行和結束階段
- 學習如何在動畫完成後執行特定操作

## 進階擴展

您可以基於此專案進行以下擴展：

### 1. 漸層方向控制
```swift
gradientLayer.startPoint = CGPoint(x: 0, y: 0)
gradientLayer.endPoint = CGPoint(x: 1, y: 1)
```

### 2. 多點漸層
```swift
gradientLayer.colors = [color1, color2, color3, color4]
gradientLayer.locations = [0.0, 0.33, 0.66, 1.0]
```

### 3. 動畫時間曲線
```swift
colorChangeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
```

### 4. 複合動畫
```swift
let group = CAAnimationGroup()
group.animations = [colorAnimation, opacityAnimation]
group.duration = 2.0
```

## 常見問題

### Q: 動畫不流暢怎麼辦？
A: 確保在主線程上執行動畫操作，避免在動畫過程中進行複雜的計算。

### Q: 如何添加更多顏色組合？
A: 在 `createColorSets()` 方法中使用 `colorSets.append()` 添加新的顏色陣列。

### Q: 可以改變動畫時長嗎？
A: 可以，修改 `colorChangeAnimation.duration` 的值即可。

### Q: 如何支援更多手勢？
A: 可以添加其他手勢識別器，如 `UISwipeGestureRecognizer` 或 `UIPanGestureRecognizer`。

## 版本歷史

- **v1.0** (2016-08-24): 初始版本發布
  - 基本的 CAGradientLayer 實現
  - 四組預設顏色組合
  - 點擊切換動畫效果

## 授權許可

本專案使用標準的版權許可，版權歸 noveltek 所有。

## 貢獻指南

歡迎提交 Issue 和 Pull Request 來改進此專案。在提交代碼前，請確保：
1. 代碼風格符合 Swift 規範
2. 添加適當的註釋
3. 測試新功能的正確性

## 聯絡資訊

如有任何問題或建議，歡迎通過以下方式聯絡：
- GitHub Issues: [提交問題](https://github.com/HyperLee/ios-CAGradientLayer/issues)
- 專案主頁: [HyperLee/ios-CAGradientLayer](https://github.com/HyperLee/ios-CAGradientLayer)

---

**感謝您使用本專案學習 iOS CAGradientLayer！** 🎉
