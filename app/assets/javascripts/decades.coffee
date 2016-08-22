$.widget("app.decades", {
  options: {}

  _create: ->
    @_bindUi()
    @_bindEvents()
    @ui.count.text(0)

  _destroy: ->
    # calls when $(".decades").decades("destroy") has been called
    @element.empty()
    console.log('this widget has been destroyed')

  _setOptions: ->
    # calls when you set an option on the widget

  _bindUi: ->
    @ui =
      count: @element.find(".js-decades-count")

  _bindEvents: ->
    @element.on("app:counter:change", (params...) => @_changeDecades(params...))

  _changeDecades: (event, value, text) ->
    decade = Math.floor(value / 10)
    @ui.count.text(decade)
    console.log(text)

  remove: ->
    this.destroy()
});

App.decades = $(".js-decades").decades()
# App.decades.remove()
