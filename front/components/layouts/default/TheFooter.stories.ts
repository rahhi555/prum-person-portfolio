import type { Story, Meta } from "@storybook/vue3"
import { withDesign } from "storybook-addon-designs"
import TheFooter from "./TheFooter.vue"

export default {
  title: "TheFooter",
  component: TheFooter,
  decorators: [withDesign]
} as Meta

const Template: Story = (args) => ({
  components: { TheFooter },
  setup() {
    return { args }
  },
  template: `<TheFooter v-bind="args" />`
})

export const Primary = Template.bind({})
Primary.parameters = {
  design: {
    type: "figma",
    url: "https://www.figma.com/file/KP1lvtsJlEfHW9aF7brgz3/Prum-Academy-PF?node-id=3%3A6"
  }
}