class Counter
  constructor: (@$el) ->
    @$counterDisplay = @$el.find(".counter__value")
    @$counterButton = @$el.find(".counter__button")
    @$counterDisplay.text(0)
    @_bindEvents()

  _bindEvents: ->
    @$counterButton.on "click", @_changeCounter

  _changeCounter: (event) =>
    buttonIndex = $(event.currentTarget).index()
    value = parseInt(@$counterDisplay.text())
    value += if buttonIndex then 1 else -1
    @_changeCounterValue(value)
    @_changeDecadesValue(value)

  _changeCounterValue: (value) ->
    @$counterDisplay.text(value)

  _changeDecadesValue: (value) ->
    $(document).trigger("app:counter:change", [value, "wow, it changes"])

counter = new Counter($(".counter"))
