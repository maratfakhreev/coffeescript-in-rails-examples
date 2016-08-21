class Decades
  constructor: (@$el) ->
    @$decadesCount = @$el.find(".decades__count")
    @$decadesCount.text(0)
    @_bindEvents()

  _bindEvents: ->
    $(document).on("app:counter:change", @_changeDecades)

  _changeDecades: (event, value, text) =>
    decade = Math.floor(value / 10)
    @$decadesCount.text(decade)
    console.log(text)

decades = new Decades($(".decades"))
