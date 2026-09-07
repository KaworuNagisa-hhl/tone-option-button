import {
  getSwiftUIGlassMaterial,
  getSwiftUIPalette,
  getSwiftUIToneSubtitle,
  getSwiftUIToneTitle,
  SWIFT_UI_RADIUS_CONTROL,
  SWIFT_UI_SPACING_SMALL,
  SWIFT_UI_TEXT_PRIMARY,
  SWIFT_UI_TEXT_TERTIARY,
  swiftUIColorWithOpacity,
  SwiftUIPalette,
  SwiftUITone
} from 'theme'

@Component
export struct SwiftUIToneOptionButton {
  @Prop tone: SwiftUITone = SwiftUITone.GlassBlack
  @Prop selectedTone: SwiftUITone = SwiftUITone.GlassBlack
  @Prop componentWidth: Length = '100%'
  @Prop componentHeight: Length = 72
  @Prop fillColor: ResourceColor = '#E6111111'
  @Prop tintColor: ResourceColor = '#00000000'
  @Prop customBorderColor: ResourceColor = '#00000000'
  @Prop customBorderWidth: number = 1
  @Prop cornerRadius: number = SWIFT_UI_RADIUS_CONTROL
  @Prop contentPadding: number = SWIFT_UI_SPACING_SMALL
  @Prop titleFontSize: number = 12
  @Prop subtitleFontSize: number = 11
  onSelect: (tone: SwiftUITone) => void = () => {
  }

  private palette(): SwiftUIPalette {
    return getSwiftUIPalette(this.tone)
  }

  private selected(): boolean {
    return this.tone === this.selectedTone
  }

  private resolvedTintColor(): ResourceColor {
    return this.tintColor === '#00000000' ? swiftUIColorWithOpacity(this.palette().surfaceBlue, this.selected() ? 0.30 : 0.16) : this.tintColor
  }

  private resolvedBorderColor(): ResourceColor {
    return this.customBorderColor === '#00000000' ? (this.selected() ? swiftUIColorWithOpacity(this.palette().primary, 0.55) : getSwiftUIGlassMaterial(this.tone).border) : this.customBorderColor
  }

  build() {
    Button() {
      Column({ space: SWIFT_UI_SPACING_SMALL }) {
        Row({ space: 0 }) {
          Blank().layoutWeight(1).height(8).backgroundColor(this.palette().primary)
          Blank().layoutWeight(1).height(8).backgroundColor(this.palette().accent)
          Blank().layoutWeight(1).height(8).backgroundColor(this.palette().surfaceBlue)
          Blank().layoutWeight(1).height(8).backgroundColor(this.palette().surfaceAmber)
        }
        .width('100%')
        .borderRadius(4)

        Row({ space: SWIFT_UI_SPACING_SMALL }) {
          Column({ space: 2 }) {
            Text(getSwiftUIToneTitle(this.tone))
              .fontSize(this.titleFontSize)
              .fontWeight(FontWeight.Bold)
              .fontColor(SWIFT_UI_TEXT_PRIMARY)
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })

            Text(getSwiftUIToneSubtitle(this.tone))
              .fontSize(this.subtitleFontSize)
              .fontColor(SWIFT_UI_TEXT_TERTIARY)
              .maxLines(2)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)

          Stack({ alignContent: Alignment.Center }) {
            Row()
              .width(16)
              .height(16)
              .backgroundColor(this.selected() ? this.palette().primary : '#00000000')
              .borderRadius(8)
              .border({ width: 1.3, color: this.selected() ? this.palette().primary : swiftUIColorWithOpacity(SWIFT_UI_TEXT_TERTIARY, 0.62) })

            if (this.selected()) {
              Text('✓')
                .fontSize(10)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.White)
                .textAlign(TextAlign.Center)
            }
          }
          .width(24)
          .height(18)
        }
        .width('100%')
        .alignItems(VerticalAlign.Top)
      }
      .width('100%')
      .height(this.componentHeight)
      .padding(this.contentPadding)
      .alignItems(HorizontalAlign.Start)
      .backgroundColor(this.fillColor)
      .linearGradient({
        direction: GradientDirection.RightBottom,
        colors: [
          [this.fillColor, 0.0],
          [this.selected() ? swiftUIColorWithOpacity(this.palette().surfaceMuted, 0.56) : this.fillColor, 0.66],
          [this.resolvedTintColor(), 1.0]
        ]
      })
      .backgroundBlurStyle(BlurStyle.Regular)
      .borderRadius(this.cornerRadius)
      .border({ width: this.customBorderWidth, color: this.resolvedBorderColor() })
      .shadow({ radius: this.selected() ? 14 : 8, color: swiftUIColorWithOpacity(this.palette().primary, this.selected() ? 0.12 : 0.06), offsetX: 0, offsetY: this.selected() ? 6 : 3 })
    }
    .width(this.componentWidth)
    .backgroundColor('#00000000')
    .onClick(() => {
      this.onSelect(this.tone)
    })
  }
}
