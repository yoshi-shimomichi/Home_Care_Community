id = "<%= @comment.id %>";
target = document.querySelector(`#comment_${id}`);
html = "<%= j(render 'comments/editform', post: @post, comment: @comment) %>";
target.innerHTML = html;

$("#comments_area").html("<%= j(render 'comments/comments', comment: @comment, post: @post) %>");
$("textarea").val('');