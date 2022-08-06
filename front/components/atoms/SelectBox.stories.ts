import { Story, Meta } from '@storybook/vue3'
import { withDesign } from 'storybook-addon-designs'
import SelectBox from './SelectBox.vue'
import type { Props } from './SelectBox.vue'

export default {
  title: 'SelectBox',
  component: SelectBox,
  decorators: [withDesign],
  parameters: {
    design: {
      type: 'figma',
      url: 'https://www.figma.com/file/KP1lvtsJlEfHW9aF7brgz3/Prum-Academy-PF?node-id=9%3A160'
    }
  }
} as Meta

const Template: Story = args => ({
  components: { SelectBox },
  setup () {
    return { args }
  },
  template: '<SelectBox v-bind="args" />'
})

const manyNumbersProps: Props = {
  options: Array.from({ length: 101 }, (_, i) => i),
  modelValue: 0
}

export const manyNumbers = Template.bind({})
manyNumbers.args = manyNumbersProps

export const selected = Template.bind({})
const selectedProps: Props = { options: Array.from({ length: 101 }, (_, i) => i), modelValue: 10 }
selected.args = selectedProps
