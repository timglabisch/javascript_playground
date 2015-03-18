abstractController = require './abstract.coffee'

module.exports = class extends abstractController

  constructor: (@lightbox) ->
    @random = Math.random()

  indexAction: (req) ->
    @dom.on 'click', =>
      return @lightbox.close() if @lightbox.isOpen()
      @lightbox.open "My Headline " + @random, "My Text"