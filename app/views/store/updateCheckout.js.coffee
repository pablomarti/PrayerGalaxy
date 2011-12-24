$("#checkout").html("<%= escape_javascript(render :partial => "checkout_item", :collection => @data) %>")
$("#finalPrice").html("Total: <%= @final %>")
loadTotalElementsOfCart()