$(function(){
  function buildHTML(comment){
    let html = `<div class="comment-box">
                  <div class="comment-name">
                  ${comment.user_name}
                  </div>
                  <div class="comment-text">
                  ${comment.text}
                  </div>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
       if(data.text.length==0){
        return false
      }
      let html = buildHTML(data);
      $('.comment').append(html);
      $('.text-box').val('');
      $('.send-box').prop('disabled', false);
    })
    .fail(function(){
      alert('コメントが未入力です');
      $('.send-box').prop('disabled', false);
    })
  })
});
