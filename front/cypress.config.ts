import { defineConfig } from "cypress";
// import { worker } from "~/mocks/browser"

export default defineConfig({
  e2e: {
    baseUrl: "http://localhost:80",
    setupNodeEvents(on, config) {
      // ćăăȘă...
      // on('before:run', () => {
      //   import('~/mocks/browser').then(({ worker }) => {
      //     worker.start();
      //   })
      // })
    },
  },
});
