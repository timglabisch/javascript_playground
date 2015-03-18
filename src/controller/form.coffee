abstractController = require './abstract.coffee'
form = require './../lib/form/form.coffee'

module.exports = class extends abstractController

  indexAction: (req) ->
    console.log "init"
    f = new form @dom
    @dom.on 'submit', (e) =>
      e.preventDefault()
      console.log f.validate().getMsgs()
