# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
	$("#submit").click ->
		$("#new_contact").submit()

	$("#submitUser").click ->
		$("#new_user").submit()