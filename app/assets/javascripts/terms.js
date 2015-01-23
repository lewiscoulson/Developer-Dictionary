$(document).ready(function() {
  $('input').on('keyup', function() {
     $.getJSON('terms?query=' + $(this).val() , function(result) {
        var html = '',
            template;

        if (result) {
          template = _.template('<a href="terms/<%- id %>"><h2><%- term %></h2><p><%- description %></p></a>');
          html = template(result);
          $('.result').html(html);
        } else {
          $('.result').html(html);
        }
     })
  });
});
