module.exports = {
 setupFilesAfterEnv: ['@testing-library/jest-dom/extend-expect'],
 transformIgnorePatterns: ["node_modules/(?!axios)"],
};