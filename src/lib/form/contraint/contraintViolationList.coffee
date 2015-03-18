module.exports = class

  constructor: ->
    @violations = []

  addViolation: (violation) ->
    @violations.push violation

  getViolations: ->
    @violations

  getMsgs: ->
    violation.getMsg() for violation in @getViolations()