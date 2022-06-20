import type { Story, Meta } from "@storybook/vue3";
import { withDesign } from "storybook-addon-designs";
import TheHeader from "./TheHeader.vue";

export default {
  title: "TheHeader",
  component: TheHeader,  
  decorators: [withDesign],
} as Meta

const Template: Story = (args) => ({
  components: { TheHeader },
  methods: {
    useCurrentUser() { return true }
  },
  setup() {
    return { args }
  },
  template: `<TheHeader v-bind="args" />`
})

export const Primary = Template.bind({})
Primary.args = {
  loginBtnText: "ログアウト"
}
Primary.parameters = {
  design: {
    type: 'figma',
    url: 'https://www.figma.com/file/KP1lvtsJlEfHW9aF7brgz3/Prum-Academy-PF?node-id=3%3A32'
  },
}
