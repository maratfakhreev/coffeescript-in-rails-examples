# This is a manifest file that'll be compiled into including all the files listed below.
# Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
# be included in the compiled file accessible from http://example.com/assets/application.js
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
#= require jquery
#= require jquery_ujs
#= require foundation
#= require current_user
#= require skim
#= require_tree ../templates
#= require_tree .

$(document).foundation()

$ ->
  $(".decades__count").text(0)

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
    decade = Math.floor(value / 10)
    $(".decades__count").text(decade)

counter = new Counter($(".counter"))
