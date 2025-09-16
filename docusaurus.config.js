// @ts-check
// `@type` JSDoc annotations allow editor autocompletion and type checking
// (when paired with `@ts-check`).
// There are various equivalent ways to declare your Docusaurus config.
// See: https://docusaurus.io/docs/api/docusaurus-config

import { themes as prismThemes } from 'prism-react-renderer';
import { generateDocusaurusPlugins, generateNavbarDropdowns } from './src/config/products.js';

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'Netwrix Product Documentation',
  tagline: 'Documentation for Netwrix Products',
  favicon: 'branding/favicon.ico',

  // Set the production url of your site here
  // Use environment variable for dynamic URL configuration
  projectName: 'docs',
  url: process.env.APP_EXTERNAL_URL || 'http://localhost:4500',
  // Set the /<baseUrl>/ pathname under which your site is served
  baseUrl: '/',

  // throw on anything that is not configured correctly
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'throw',
  onBrokenAnchors: 'throw',

  // Set Mermaid
  markdown: {
    mermaid: true,
  },
  themes: ['@docusaurus/theme-mermaid'],

  // Performance optimizations with Docusaurus Faster
  future: {
    experimental_faster: {
      swcJsLoader: true,
      swcJsMinimizer: true,
      swcHtmlMinimizer: true,
      lightningCssMinimizer: true,
      rspackBundler: true,
      rspackPersistentCache: true, // 2-5x faster rebuilds
      mdxCrossCompilerCache: true,
      ssgWorkerThreads: true, // 2x faster static generation
    },
    v4: {
      removeLegacyPostBuildHeadAttribute: true, // Required for worker threads
      // useCssCascadeLayers: true, // Temporarily disabled - may cause style conflicts
    },
  },

  // Even if you don't use internationalization, you can use this field to set
  // useful metadata like html lang. For example, if your site is Chinese, you
  // may want to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  scripts: [
    // Add gtag fallback to prevent errors if gtag isn't present
    {
      src: 'data:text/javascript;base64,Ly8gSW5pdGlhbGl6ZSBndGFnIGZhbGxiYWNrIGlmIG5vdCBhbHJlYWR5IHByZXNlbnQKd2luZG93LmRhdGFMYXllciA9IHdpbmRvdy5kYXRhTGF5ZXIgfHwgW107CmlmICh0eXBlb2Ygd2luZG93Lmd0YWcgPT09ICd1bmRlZmluZWQnKSB7CiAgZnVuY3Rpb24gZ3RhZygpe3dpbmRvdy5kYXRhTGF5ZXIucHVzaChhcmd1bWVudHMpO30KICB3aW5kb3cuZ3RhZyA9IGd0YWc7Cn0=',
      async: true,
    },
    {
      src: 'https://widget.kapa.ai/kapa-widget.bundle.js',
      'data-website-id': 'c8052612-e9cf-49f8-b7a4-e717c6adc398',
      'data-project-name': 'Netwrix',
      'data-project-color': '#F5F5F5',
      'data-project-logo': 'https://img.netwrix.com/elements/social_communities/netwrix_blog.svg',
      'data-user-analytics-cookie-enabled': 'true',
      'data-modal-title': 'Netwrix Docs AI Assistant',
      'data-modal-example-questions-title': 'Try asking me...',
      'data-modal-disclaimer': 'This **AI assistant answers Netwrix questions** using the documentation.',
      'data-modal-example-questions':
        'How to reduce Audit DB size?,How to scan for sensitive data?,How to migrate NEA to new server?,How to upload archive to SQL DB?',
      'data-button-text-color': '#E32C2D',
      async: true,
    },
  ],

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: false,
        blog: false,
        theme: {
          customCss: './src/css/custom.css',
        },
      }),
    ],
  ],

  plugins: [
    // Google Analytics
    [
      '@docusaurus/plugin-google-gtag',
      {
        trackingID: 'G-FZPWSDMTEX',
        anonymizeIP: true,
      },
    ],
    // Generate all product documentation plugins from centralized configuration
    ...generateDocusaurusPlugins().map(([pluginName, config]) => [
      pluginName,
      {
        ...config,
        // Safer: only require.resolve if it's a string path; otherwise pass through
        sidebarPath:
          config.sidebarPath && typeof config.sidebarPath === 'string'
            ? require.resolve(config.sidebarPath)
            : config.sidebarPath,
      },
    ]),
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      // MermaidJS Config
      mermaid: {
        theme: {
          light: 'neutral',
          dark: 'dark',
        },
        options: {
          look: 'handDrawn',
          handDrawnSeed: 1,
        },
      },
      // Replace with your project's social card
      image: 'img/Logo_RGB.svg',
      docs: {
        sidebar: {
          hideable: true,
          autoCollapseCategories: false,
        },
      },
      algolia: {
        appId: 'KPMSCF6G6J',
        apiKey: '1b20f30f13a874cd46f9d5c30b01d99c', // search-only API key
        indexName: 'Production Docs',
        contextualSearch: true,
        searchParameters: {
          facetFilters: [],
          attributesToSnippet: ['content:20'],
          highlightPreTag: '<mark>',
          highlightPostTag: '</mark>',
          hitsPerPage: 20,
          distinct: true,
          clickAnalytics: true,
          analytics: true,
        },
        insights: true,
        searchPagePath: 'search',
        placeholder: 'Search the Netwrix docs...',
        transformItems: (items) =>
          items.map((item) => ({
            ...item,
            _highlightResult: {
              ...item._highlightResult,
            },
          })),
      },
      navbar: {
        logo: {
          alt: 'Netwrix Logo',
          src: 'branding/logo-red.svg',
          srcDark: 'branding/logo-white.svg',
          href: '/',
        },
        items: [
          ...generateNavbarDropdowns(),
          { href: 'https://community.netwrix.com', label: 'Community', position: 'right' },
          { href: 'https://www.netwrix.com/support.html', label: 'Support', position: 'right' },
          { href: 'http://github.com/netwrix', label: 'GitHub', position: 'right' },
        ],
      },
      prism: {
        theme: prismThemes.github,
        darkTheme: prismThemes.dracula,
        additionalLanguages: ['powershell', 'bash'],
      },
    }),

  // Add preconnect for better search performance
  headTags: [
    {
      tagName: 'link',
      attributes: {
        rel: 'preconnect',
        href: 'https://KPMSCF6G6J-dsn.algolia.net',
        crossorigin: 'anonymous',
      },
    },
  ],
  stylesheets: ['https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap'],
};

export default config;
