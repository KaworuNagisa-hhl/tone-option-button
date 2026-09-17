import { SwiftUIToneOptionButton } from 'tone-option-button'
import { SwiftUITone } from 'theme'

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
