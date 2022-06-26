import type { Story, Meta } from "@storybook/vue3";
import { withDesign } from "storybook-addon-designs";
import CardRow from "./CardRow.vue";
import AtomsButton from "../atoms/Button.vue";
import SelectBox from "../atoms/SelectBox.vue";

export default {
  title: "CardRow",
  component: CardRow,
  decorators: [withDesign],
  parameters: {
    design: {
      type: "figma",
      url: "https://www.figma.com/file/KP1lvtsJlEfHW9aF7brgz3/Prum-Academy-PF?node-id=9%3A34",
    },
  },
  argTypes: {
    size: {
      control: {
        type: "inline-radio",
        options: ["medium", "large"],
      }
    }
  }
} as Meta;

const Template: Story = () => ({
  components: { CardRow, AtomsButton, SelectBox },
  template: `<CardRow>
              <template #skill-name>Ruby</template>
              <template #select-box><SelectBox :options="Array.from({ length: 100 }, (_, i) => i + 1)" /></template>
              <template #primary-button><AtomsButton :text="'習得レベルを保存する'" :color="'primary'" :outline="true" :size="'small'" /></template>
              <template #secondary-button><AtomsButton :text="'スキルを削除する'" :color="'secondary'" :size="'small'" /></template>
            </CardRow>`,
});

export const Ruby = Template.bind({});

const Template2: Story = () => ({
  components: { CardRow },
  template: `<CardRow>
              <template #header1>習得スキル</template>
              <template #header2>習得レベル</template>
              <template #header3></template>
              <template #header4></template>
            </CardRow>`,
});

export const Header = Template2.bind({});
