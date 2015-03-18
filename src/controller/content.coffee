abstractController = require './abstract.coffee'

module.exports = class extends abstractController

  clicks: 0

  indexAction: (req) ->
    @dom.find('.txt').html "Klick mich."
    @dom.find('.txt').on 'click', @onFooClicked.bind @

  onFooClicked: =>
    @dom.find('.clicks').html @clicks++