App.Views ||= {}

class App.Views.Decades extends Backbone.View
  initialize: ->
    @_bindUi()
    @_bindEvents()
    @ui.count.text(0)

  _bindUi: ->
    @ui =
      count: @$(".js-decades-count")

  _bindEvents: ->
    this.listenTo(App.counter, "app:counter:change", @_changeDecades)

  _changeDecades: (value, text) =>
    decade = Math.floor(value / 10)
    @ui.count.text(decade)
    console.log(text)

App.decades = new App.Views.Decades({ el: $(".js-decades") })
