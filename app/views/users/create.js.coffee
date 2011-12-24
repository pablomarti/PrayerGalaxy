alert("<%= @message %>")
<% if @status == 1 %>
window.location = "<%= url_for mindex_path %>"
<% end %>