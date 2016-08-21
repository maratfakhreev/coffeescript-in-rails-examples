class Decades
  constructor: (@$el) ->
    @_bindUi()
    @_bindEvents()
    @ui.count.text(0)

  _bindUi: ->
    @ui =
      count: @$el.find(".decades__count")

  _bindEvents: ->
    $(document).on("app:counter:change", @_changeDecades)

  _changeDecades: (event, value, text) =>
    decade = Math.floor(value / 10)
    @ui.count.text(decade)
    console.log(text)

decades = new Decades($(".decades"))
