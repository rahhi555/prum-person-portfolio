module.exports = {
  stories: ['../components/**/*.stories.ts'],
  addons: ['@storybook/addon-essentials', 'storybook-addon-designs'],
  framework: '@storybook/vue3',
  core: {
    builder: '@storybook/builder-vite',
  },
}