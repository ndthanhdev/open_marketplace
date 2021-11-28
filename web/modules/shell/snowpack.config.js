// Snowpack Configuration File
// See all supported options: https://www.snowpack.dev/reference/configuration

/** @type {import("snowpack").SnowpackUserConfig } */
module.exports = {
  mount: {
    /* ... */
    src: "/",
  },
  plugins: [
    /* ... */
  ],
  packageOptions: {
    /* ... */
    knownEntrypoints: ["zen-observable-ts"],
  },
  devOptions: {
    /* ... */
    open: "none",
  },
  buildOptions: {
    /* ... */
  },
};
