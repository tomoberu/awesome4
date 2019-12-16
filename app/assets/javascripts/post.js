$(function() {
  function buildHTML(post){
    var html = `<p>
                  <strong>
                    <a href=/users/${post.user_id}>${post.user_name}</a>
                    ：
                  </strong>
                  ${post.text}
                </p>`
    return html;
  }
  $('#new_comment').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.posts').append(html);
      $('.name').val('');
      $('.age').val('');
      $('.url').val('');
      $('.address').val('');
      $('.text').val('');
      $('.btn').prop('disabled', false);
    })
  });
});