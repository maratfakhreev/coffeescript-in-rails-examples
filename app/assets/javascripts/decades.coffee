App.Components ||= {}

class App.Components.Decades
  constructor: (@$el) ->
    @_bindUi()
    @_bindEvents()
    @ui.count.text(0)

  _bindUi: ->
    @ui =
      count: @$el.find(".js-decades-count")

  _bindEvents: ->
    $(document).on("app:counter:change", @_changeDecades)

  _changeDecades: (event, value, text) =>
    decade = Math.floor(value / 10)
    @ui.count.text(decade)
    console.log(text)

decades = new App.Components.Decades($(".js-decades"))
