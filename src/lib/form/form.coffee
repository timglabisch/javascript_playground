notBlankContraint = require './contraint/factory/notBlankContraintFactory.coffee'
notBlankValidator = require './contraint/validator/notBlankValidator.coffee'
constraintViolationList = require './contraint/contraintViolationList.coffee'

module.exports = class

  constructor: (@dom) ->
    @contraintFactories = [new notBlankContraint]
    @validators = [new notBlankValidator]

  validate: ->
    contraintViolationList = new constraintViolationList
    contraints = @extractContraints @dom

    for contraint in contraints
      for validator in @validators when validator.supports contraint
        validator.validate contraint, contraintViolationList

    contraintViolationList


  extractContraints: (dom) ->
    items = []
    for formField in dom.find('[data-contraints]')
      items.push x for x in @createContraintByName $(formField)
    items


  createContraintByName: (contraintDom) ->
    for contraintFactory in @contraintFactories when contraintFactory.supports contraintDom
      contraintFactory.getConstraint contraintDom




