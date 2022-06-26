const { mergeConfig } = require('vite');
const path = require('path')

module.exports = {
  stories: ['../components/**/*.stories.ts'],
  addons: ['@storybook/addon-essentials', 'storybook-addon-designs'],
  framework: '@storybook/vue3',
  core: {
    builder: '@storybook/builder-vite',
  },
  viteFinal: async (config) => {
    return mergeConfig(config, {
      resolve: {
        alias: {
          '@': path.resolve(__dirname, '../'),
          '~': path.resolve(__dirname, '../'),
          '~~': path.resolve(__dirname, '../')
        },
      },
    })
  },
}