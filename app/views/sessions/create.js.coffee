<% if @status == 1 %>
window.location = "<%= @location %>"
<% else %>
alert("Invalid email or password")
<% end %>