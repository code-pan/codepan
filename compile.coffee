Metalsmith  = require 'metalsmith'
templates   = require 'metalsmith-templates'
permalinks  = require 'metalsmith-permalinks'
markdown    = require 'metalsmith-markdown'
stylus      = require 'metalsmith-stylus'
watch       = require 'metalsmith-watch'
collections = require 'metalsmith-collections'
assets      = require 'metalsmith-assets'

Metalsmith __dirname
  .use watch pattern: '**/*'
  .use (files, metalsmith, done) ->
    v.path = f.replace /\.[a-z]+$/g, '' for f, v of files
    do done
  .use collections {
    sections : { pattern: 'section*.md', sortBy: 'sort' }
    footers  : { pattern: 'footer*.md' }
  }
  .use markdown()
  .use templates engine: 'jade', pattern: '*.html', default: 'layout.jade'
  .use stylus()
  .use assets source: './images'
  .build (err, files) ->
    console.log err if err
