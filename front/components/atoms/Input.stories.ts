import type { Story, Meta } from "@storybook/vue3"
import { withDesign } from "storybook-addon-designs"
import InputVue from "./Input.vue"

export default {
  title: "InputVue",
  component: InputVue,
  decorators: [withDesign],
  parameters: {
    design: {
      type: 'figma',
      url: 'https://www.figma.com/file/KP1lvtsJlEfHW9aF7brgz3/Prum-Academy-PF?node-id=3%3A48'
    }
  }
} as Meta

const Template: Story = (args) => ({
  components: { InputVue },
  setup() {
    return { args }
  },
  template: `<InputVue v-bind="args" />`
})

export const Email = Template.bind({})
Email.args = {
  id: "email",
  type: "email",
  label: "メールアドレス"
}

export const Password = Template.bind({})
Password.args = {
  id: "password",
  type: "password",
  label: "パスワード"
}