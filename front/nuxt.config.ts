import { defineNuxtConfig } from "nuxt";

// https://v3.nuxtjs.org/api/configuration/nuxt.config
export default defineNuxtConfig({
  typescript: {
    shim: false,
    strict: true,
    tsConfig: {
      "compilerOptions": {
        "paths": { "/front/*": ["*"] }
      },
    }
  },

  app: {
    head: {
      link: [
        { rel: "preconnect", href: "https://fonts.googleapis.com" },
        { rel: "preconnect", href: "https://fonts.gstatic.com", crossOrigin: true },
        {
          rel: "stylesheet",
          href: "https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap",
        },
      ],
    },
  },

  modules: ["nuxt-graphql-client"],

  runtimeConfig: {
    public: {
      GQL_HOST:
        process.env.NODE_ENV === "production"
          ? "https://www.hirabayashi.work:3000/graphql"
          : "http://prum-api:3000/graphql",
      GQL_CLIENT_HOST:
        process.env.NODE_ENV === "production"
          ? "https://www.hirabayashi.work:3000/graphql"
          : "http://localhost:3000/graphql",
      FILE_UPLOAD_HOST:
        process.env.NODE_ENV === "production"
          ? "https://www.hirabayashi.work:3000/file_upload"
          : "http://localhost:3000/file_upload",
    },
  },
});
