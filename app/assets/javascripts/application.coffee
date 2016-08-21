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
  $(".counter__value").text(0)
  $(".decades__count").text(0)

  renderDozens = (value) ->
    decade = Math.floor(value / 10)
    $(".decades__count").text(decade)

  $(".counter__button").eq(0).on "click", ->
    value = $(".counter__value").text()
    counterValue = parseInt(value) - 1
    $(".counter__value").text(counterValue)
    renderDozens(counterValue)

  $(".counter__button").eq(1).on "click", ->
    value = $(".counter__value").text()
    counterValue = parseInt(value) + 1
    $(".counter__value").text(counterValue)
    renderDozens(counterValue)
