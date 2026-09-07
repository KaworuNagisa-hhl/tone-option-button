import { describe, it, expect } from '@ohos/hypium'
import { getSwiftUIToneTitle, SwiftUITone } from 'theme'

export default function localUnitTest() {
  describe('SwiftUIToneOptionButton', () => {
    it('executes_select_callback_contract', 0, () => {
      let selected = SwiftUITone.CareGreen
      const onSelect = (tone: SwiftUITone) => {
        selected = tone
      }
      onSelect(SwiftUITone.ClinicalBlue)
      expect(selected).assertEqual(SwiftUITone.ClinicalBlue)
      expect(getSwiftUIToneTitle(selected).toString()).assertEqual('Clinical Blue')
    })
  })
}
