module.exports = class

  is_open: false

  constructor: ->
    @template = $ """
      <div class="lightbox">
        <h3>lightbox title</h3>
        <div class="txt">lightbox text</div>
      </div>
    """
    @template.hide()
    @headline = @template.find('h3')
    @text = @template.find('.txt')

  isOpen: -> @is_open

  open: (headline, text) ->
    @template.appendTo $('body') if ! @is_open
    @template.show()
    @headline.html headline
    @text.html text
    @is_open = true

  close: ->
    @template.hide()
    @is_open = false

