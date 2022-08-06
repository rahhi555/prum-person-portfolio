import type { Story, Meta } from '@storybook/vue3'
import { withDesign } from 'storybook-addon-designs'
import SkillCard from './SkillCard.vue'

export default {
  title: 'SkillCard',
  component: SkillCard,
  decorators: [withDesign]
} as Meta

const Template: Story = args => ({
  components: { SkillCard },
  setup () {
    return { args }
  },
  template: '<SkillCard v-bind="args" />'
})

type Category = {
  id: string;
  name: string;
  skills: {
      id: string;
      level: number;
      name: string;
  }[]
}

const category: Category = {
  id: '1',
  name: 'バックエンド',
  skills: [
    { id: '1', level: 10, name: 'Ruby' },
    { id: '2', level: 50, name: 'Rails' },
    { id: '3', level: 100, name: 'MySQL' }
  ]
}

export const Primary = Template.bind({})
Primary.args = { category }

Primary.parameters = {
  design: {
    type: 'figma',
    url: 'https://www.figma.com/file/KP1lvtsJlEfHW9aF7brgz3/Prum-Academy-PF?node-id=3%3A143'
  }
}
