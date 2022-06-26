import type { Story, Meta } from "@storybook/vue3"
import { withDesign } from "storybook-addon-designs"
import CardHeader from "./CardHeader.vue"
import type { Props } from "./CardHeader.vue"

export default {
  title: "CardHeader",
  component: CardHeader,
  decorators: [withDesign],
  argTypes: {
    buttonColor: {
      control: {
        type: "inline-radio",
        options: ["primary", "secondary"]
      }
    }
  }
} as Meta

const Template: Story = (args) => ({
  components: { CardHeader },
  setup() { 
    return { args }
  },
  template: `<CardHeader v-bind="args" />`
})


export const Primary = Template.bind({})
Primary.args = { 
  title: "バックエンド",
  buttonColor: "primary",
  buttonText: "スキルを追加する"
 } as Props

Primary.parameters = {
  design: {
    type: 'figma',
    url: 'https://www.figma.com/file/KP1lvtsJlEfHW9aF7brgz3/Prum-Academy-PF?node-id=3%3A143'
  }
}