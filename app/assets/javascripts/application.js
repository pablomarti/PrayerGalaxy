// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

var position = 0;
var videoPosition = 0;

function submitLogin(){
	$("#loginForm").submit();
}

function moveSlider(right){
	if(right==0){
		if(position>0){
			position--;
			$('#slidesContainer').animate({
			    left: '+=545'
				}, 1000, function() {
			    	//alert("Complete0");
			});
		}
	}
	else{
		if(position<4){
			position++;
			$('#slidesContainer').animate({
			    left: '-=545'
				}, 1000, function() {
			    	//alert("Complete1");
			});
		}
	}
}

function moveVideoSlider(right, videoItemsLength){
	videoItemsLength -= 5;
	
	if(right==0){
		if(videoPosition>0){
			videoPosition--;
			$('#mainSliderAuxiliar').animate({
			    left: '+=111'
				}, 1000, function() {
			    	//alert("Complete0");
			});
		}
	}
	else{
		if(videoPosition<videoItemsLength){
			videoPosition++;
			$('#mainSliderAuxiliar').animate({
			    left: '-=111'
				}, 1000, function() {
			    	//alert("Complete1");
			});
		}
	}
}

function loadTotalElementsOfCart(){
	$(".totalElements").keyup(function(){
		$.ajax({
		  type: "GET",
		  url: $(this).data("urlproduct"),
		  data: "id=" + $(this).data("itemid") + "&total=" + parseInt($(this).val()),
		  dataType: "script"
		});
	});
}
	