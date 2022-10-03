module.exports = {
  purge: [
    "./app/**/*.html.erb",
    "./app/**/*.html.slim",
    "./app/helpers/**/*.rb",
    "./app/javascript/packs/**/*.js",
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    fontFamily: {
      body: [
        "Helvetica Neue",
        "Arial",
        "Hiragino Kaku Gothic ProN",
        "Hiragino Sans",
        "Meiryo",
        "sans-serif",
      ],
    },
    extend: {
      colors: {
        'cyan': "#C2DED1",
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
