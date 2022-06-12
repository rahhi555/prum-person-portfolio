import type { Story, Meta } from "@storybook/vue3"
import { withDesign } from "storybook-addon-designs"
import ButtonVue from "./Button.vue"

export default {
  title: "ButtonVue",
  component: ButtonVue,
  decorators: [withDesign]
} as Meta

const Template: Story = (args) => ({
  components: { ButtonVue },
  setup() {
    return { args }
  },
  template: `<ButtonVue v-bind="args" />`
})

export const Primary = Template.bind({})
Primary.args = {
  color: 'primary',
  text: 'ログインする'
}
Primary.parameters = {
  design: {
    type: 'figma',
    url: 'https://www.figma.com/file/KP1lvtsJlEfHW9aF7brgz3/Prum-Academy-PF?node-id=3%3A87'
  }
}

export const Secondary = Template.bind({})
Secondary.args = {
  color: 'secondary',
  text: 'スキルを削除する'
}
Primary.parameters = {
  design: {
    type: 'figma',
    url: 'https://www.figma.com/file/KP1lvtsJlEfHW9aF7brgz3/Prum-Academy-PF?node-id=9%3A157'
  }
}
