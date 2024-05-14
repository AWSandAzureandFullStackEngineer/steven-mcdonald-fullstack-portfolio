module.exports = {
 setupFilesAfterEnv: ['@testing-library/jest-dom/extend-expect'],
 moduleNameMapper: {
  axios: require.resolve("axios"),
}
};