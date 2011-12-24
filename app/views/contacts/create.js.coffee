alert("<%= @message %>")
<% if @status == 1 %>
$("#contact_name").val("")
$("#contact_lastname").val("")
$("#contact_email").val("")
$("#contact_phone").val("")
$("#contact_about").val("")
$("#contact_comment").val("")
<% end %>