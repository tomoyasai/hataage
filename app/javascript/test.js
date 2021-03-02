$(function(){
  $('.like').on('click', function(e){
    alert($("#string").text());
  });
});


// $("#button").on("click", function(){
//   alert($("#string").text());
// });

$("#button").on("click", function(){
  $("#parent").text("変更後の文章");
});