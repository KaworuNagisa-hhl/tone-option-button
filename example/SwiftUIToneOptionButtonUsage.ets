import { SwiftUIToneOptionButton } from '@kaworunagisa_hhl/tone-option-button'
import { SwiftUITone } from '@kaworunagisa_hhl/theme'

@Component
export struct SwiftUIToneOptionButtonUsage {
  @State private selectedTone: SwiftUITone = SwiftUITone.GlassBlack

  build() {
    SwiftUIToneOptionButton({
      tone: SwiftUITone.PureWhite,
      selectedTone: this.selectedTone
    })
      .onClick(() => {
        this.selectedTone = SwiftUITone.PureWhite
      })
  }
}
