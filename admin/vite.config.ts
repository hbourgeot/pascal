import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
  plugins: [sveltekit()],
  build: {
    sourcemap: true,
  },
  assetsInclude: ["**/*.pdf"],
  // change port to 5174
  server: {
    port: 5174,
  },
});
