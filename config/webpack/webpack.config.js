const { generateWebpackConfig, inliningCss } = require('shakapacker');
const isDevelopment = process.env.NODE_ENV !== 'production';
const ReactRefreshWebpackPlugin = isDevelopment ? require('@pmmmwh/react-refresh-webpack-plugin') : null;

const webpackConfig = generateWebpackConfig();

if (isDevelopment && inliningCss) {
  webpackConfig.plugins.push(
    new ReactRefreshWebpackPlugin()
  );
}

module.exports = webpackConfig;