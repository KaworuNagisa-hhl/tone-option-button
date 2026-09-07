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
  SwiftUIComponentConfig,
  SwiftUIPalette,
  SwiftUITone
} from 'theme'

@Component
export struct SwiftUIToneOptionButton {
  @Prop config: SwiftUIComponentConfig = new SwiftUIComponentConfig()
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

  private resolvedWidth(): Length {
    return this.config.width === undefined ? this.componentWidth : this.config.width
  }

  private resolvedHeight(): Length {
    return this.config.height === undefined ? this.componentHeight : this.config.height
  }

  private resolvedFillColor(): ResourceColor {
    return this.config.fillColor === undefined ? this.fillColor : this.config.fillColor
  }

  private resolvedCornerRadius(): number {
    return this.config.cornerRadius === undefined ? this.cornerRadius : this.config.cornerRadius
  }

  private resolvedBorderWidth(): number {
    return this.config.borderWidth === undefined ? this.customBorderWidth : this.config.borderWidth
  }

  private resolvedContentPadding(): number {
    return this.config.contentPadding === undefined ? this.contentPadding : this.config.contentPadding
  }

  private resolvedTitleFontSize(): number {
    return this.config.titleFontSize === undefined ? this.titleFontSize : this.config.titleFontSize
  }

  private resolvedSubtitleFontSize(): number {
    return this.config.subtitleFontSize === undefined ? this.subtitleFontSize : this.config.subtitleFontSize
  }

  private palette(): SwiftUIPalette {
    return getSwiftUIPalette(this.tone)
  }

  private selected(): boolean {
    return this.tone === this.selectedTone
  }

  private resolvedTintColor(): ResourceColor {
    if (this.config.tintColor) {
      return this.config.tintColor
    }
    return this.tintColor === '#00000000' ? swiftUIColorWithOpacity(this.palette().surfaceBlue, this.selected() ? 0.30 : 0.16) : this.tintColor
  }

  private resolvedBorderColor(): ResourceColor {
    if (this.config.borderColor) {
      return this.config.borderColor
    }
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
              .fontSize(this.resolvedTitleFontSize())
              .fontWeight(FontWeight.Bold)
              .fontColor(SWIFT_UI_TEXT_PRIMARY)
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })

            Text(getSwiftUIToneSubtitle(this.tone))
              .fontSize(this.resolvedSubtitleFontSize())
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
      .height(this.resolvedHeight())
      .padding(this.resolvedContentPadding())
      .alignItems(HorizontalAlign.Start)
      .backgroundColor(this.resolvedFillColor())
      .linearGradient({
        direction: GradientDirection.RightBottom,
        colors: [
          [this.resolvedFillColor(), 0.0],
          [this.selected() ? swiftUIColorWithOpacity(this.palette().surfaceMuted, 0.56) : this.resolvedFillColor(), 0.66],
          [this.resolvedTintColor(), 1.0]
        ]
      })
      .backgroundBlurStyle(BlurStyle.Regular)
      .borderRadius(this.resolvedCornerRadius())
      .border({ width: this.resolvedBorderWidth(), color: this.resolvedBorderColor() })
      .shadow({ radius: this.selected() ? 14 : 8, color: swiftUIColorWithOpacity(this.palette().primary, this.selected() ? 0.12 : 0.06), offsetX: 0, offsetY: this.selected() ? 6 : 3 })
    }
    .width(this.resolvedWidth())
    .backgroundColor('#00000000')
    .onClick(() => {
      this.onSelect(this.tone)
    })
  }
}
