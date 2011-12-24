# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
	videoItemsLength = $("#mainSliderAuxiliar").children().length
	$("#mainSliderAuxiliar").css("width",(111*videoItemsLength) + "px")

	$("#videoLeftArrow").click ->
		moveVideoSlider(0, videoItemsLength)			

	$("#videoRightArrow").click ->
		moveVideoSlider(1, videoItemsLength)