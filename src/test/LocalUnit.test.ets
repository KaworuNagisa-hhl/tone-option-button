import { describe, it, expect } from '@ohos/hypium'
import { getSwiftUIToneTitle, SwiftUITone } from 'theme'

export default function localUnitTest() {
  describe('SwiftUIToneOptionButton', () => {
    it('executes_select_callback_contract', 0, () => {
      let selected = SwiftUITone.PureWhite
      const onSelect = (tone: SwiftUITone) => {
        selected = tone
      }
      onSelect(SwiftUITone.SystemGray)
      expect(selected).assertEqual(SwiftUITone.SystemGray)
      expect(getSwiftUIToneTitle(selected).toString()).assertEqual('System Gray')
    })
  })
}
