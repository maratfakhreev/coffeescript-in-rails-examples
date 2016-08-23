App.Components ||= {}

class App.Components.Counter extends Backbone.View
  events:
    "click .js-button": "_changeCounter"

  initialize: ->
    @_bindUi()
    @ui.display.text(0)

  _bindUi: ->
    @ui =
      display: @$el.find(".js-value")

  _changeCounter: (event) ->
    $button = $(event.currentTarget)
    value = parseInt(@ui.display.text())
    value = @_calcValue($button, value)
    @_changeCounterValue(value)
    @_changeDecadesValue(value)

  _changeCounterValue: (value) ->
    @ui.display.text(value)

  _changeDecadesValue: (value) ->
    this.trigger("app:counter:change", value, "wow, it changes")

  _calcValue: ($button, value) ->
    ++value if $button.hasClass("js-button--increase")
    --value if $button.hasClass("js-button--decrease")
    value

App.counter = new App.Components.Counter({ el: $(".js-counter") })
