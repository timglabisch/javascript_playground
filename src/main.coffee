_di = require './lib/di.coffee'
_dispatcher = require './lib/dispatcher.coffee'
_controllerContent = require './controller/content.coffee'
_controllerProduct = require './controller/product.coffee'
_controllerForm = require './controller/form.coffee'
_lightbox = require './service/lightbox.coffee'

class main
  di: null

  getContainer: ->
    return @di if @di
    @di = new _di
    @di.set 'di', @di
    @di.configure
      factories:
        dispatcher: (di) -> di.auto _dispatcher
        controllerContent: (di) -> new _controllerContent
        controllerProduct:
          shared: false,
          factory: (di) -> di.auto _controllerProduct
        controllerForm:
          shared: false,
          factory: (di) -> new _controllerForm
        lightbox: (di) -> new _lightbox
    @di

  handle: (request) ->
    @getContainer().get('dispatcher')().dispatchRoute request

app = new main
$('document').ready ->
  $('.app_controller').each (i, el) ->
    try
      app.handle
        controller: $(el).data('controller')
        dom: $(el)
    catch e
      console.log e