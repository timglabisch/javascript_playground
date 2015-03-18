notBlankContraint = require './../notBlankContraint.coffee'

module.exports = class

  supports: (dom) ->
    dom.data('contraints').indexOf('notBlank') != -1

  getConstraint: (dom) ->
    new notBlankContraint dom, dom.val()