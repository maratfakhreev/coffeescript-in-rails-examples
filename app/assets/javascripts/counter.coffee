App.Components ||= {}

$.widget("app.counter", {
  options: {}

  _create: ->
    @_bindUi()
    @_bindEvents()
    @ui.display.text(0)

  _destroy: ->
    # calls when $(".decades").decades("destroy") has been called
    @element.empty()
    console.log('this widget has been destroyed')

  _bindUi: ->
    @ui =
      display: @element.find(".js-value")
      button: @element.find(".js-button")

  _bindEvents: ->
    @ui.button.on "click", (params...) => @_changeCounter(params...)

  _changeCounter: (event) ->
    $button = $(event.currentTarget)
    value = parseInt(@ui.display.text())
    value = @_calcValue($button, value)
    @_changeCounterValue(value)
    @_changeDecadesValue(value)

  _changeCounterValue: (value) ->
    @ui.display.text(value)

  _changeDecadesValue: (value) ->
    @element.trigger("app:counter:change", [value, "wow, it changes"])

  _calcValue: ($button, value) ->
    ++value if $button.hasClass('js-button--increase')
    --value if $button.hasClass('js-button--decrease')
    value
})

App.counter = $(".js-counter").counter()
# App.counter.remove()
