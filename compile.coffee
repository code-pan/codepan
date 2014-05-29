Metalsmith = require 'metalsmith'
templates  = require 'metalsmith-templates'
permalinks = require 'metalsmith-permalinks'
markdown   = require 'metalsmith-markdown'
stylus     = require 'metalsmith-stylus'
watch      = require 'metalsmith-watch'

Metalsmith __dirname
  .use watch()
  .use markdown()
  .use templates engine: 'jade', pattern: '*.html', default: 'layout.jade'
  .use stylus()
  .build console.log
