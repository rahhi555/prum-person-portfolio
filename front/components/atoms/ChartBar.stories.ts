import type { Story, Meta } from '@storybook/vue3'
import { withDesign } from 'storybook-addon-designs'
import ChartBar from './ChartBar.vue'
import type { Props } from './ChartBar.vue'

export default {
  title: 'ChartBar',
  component: ChartBar,
  decorators: [withDesign]
} as Meta

const Template: Story = args => ({
  components: { ChartBar },
  setup () {
    return { args }
  },
  template: '<ChartBar v-bind="args" />'
})

const props: Props = {
  chartData: {
    labels: ['バックエンド', 'フロントエンド', 'インフラ'],
    datasets: [{
      label: 'Ruby',
      data: [10, null, null],
      backgroundColor: '#FF6384'
    },
    {
      label: 'Rails',
      data: [20, null, null],
      backgroundColor: 'blue'
    },
    {
      label: 'Postgres',
      data: [30, null, null],
      backgroundColor: 'yellow'
    },
    {
      label: 'vue',
      data: [null, 30, null],
      backgroundColor: 'green'
    },
    {
      label: 'javascript',
      data: [null, 15, null],
      backgroundColor: 'red'
    },
    {
      label: 'typescript',
      data: [null, 40, null],
      backgroundColor: 'purple'
    },
    {
      label: 'AWS',
      data: [null, null, 10],
      backgroundColor: 'orange'
    },
    {
      label: 'GCP',
      data: [null, null, 20],
      backgroundColor: 'grey'
    },
    {
      label: 'Azure',
      data: [null, null, 30],
      backgroundColor: 'purple'
    }]
  }
}

export const Primary = Template.bind({})
Primary.parameters = {
  design: {
    type: 'figma',
    url: 'https://www.figma.com/file/KP1lvtsJlEfHW9aF7brgz3/Prum-Academy-PF?node-id=3%3A23'
  }
}
Primary.args = props
