notBlankContraint = require './../notBlankContraint.coffee'
contraintViolation = require './../contraintViolation.coffee'

module.exports = class

  supports: (contraint) -> contraint instanceof notBlankContraint

  validate: (contraint, contraintViolationList) ->
    if contraint.getText().trim() == ""
      contraintViolationList.addViolation new contraintViolation contraint, "Text should not be empty."

    contraintViolationList