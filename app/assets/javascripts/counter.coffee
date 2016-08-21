class Counter
  constructor: (@$el) ->
    @_bindUi()
    @_bindEvents()
    @ui.display.text(0)

  _bindUi: ->
    @ui =
      display: @$el.find(".counter__value")
      button: @$el.find(".counter__button")

  _bindEvents: ->
    @ui.button.on "click", @_changeCounter

  _changeCounter: (event) =>
    $button = $(event.currentTarget)
    value = parseInt(@ui.display.text())
    value = @_calcValue($button, value)
    @_changeCounterValue(value)
    @_changeDecadesValue(value)

  _changeCounterValue: (value) ->
    @ui.display.text(value)

  _changeDecadesValue: (value) ->
    $(document).trigger("app:counter:change", [value, "wow, it changes"])

  _calcValue: ($button, value) ->
    value += 1 if $button.hasClass('counter__button--increase')
    value -= 1 if $button.hasClass('counter__button--decrease')
    value

counter = new Counter($(".counter"))
