# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
	$(".arrowLeft").click ->
		moveSlider(0)			

	$(".arrowRight").click ->
		moveSlider(1)

	$("#submitSearch").click ->
		$("#searchForm").submit()

	$(".addToCheckout").click ->
		if parseInt($("#total").val()) or $(".addToCheckout").data("cero")
			$.ajax({
			  type: "GET",
			  url: $(".addToCheckout").data("urlproduct"),
			  data: "id=" + $(".addToCheckout").data("itemid") + "&total=" + parseInt($("#total").val()),
			  dataType: "script"
			});
		else
			alert("First you have to enter the total");

	loadTotalElementsOfCart()