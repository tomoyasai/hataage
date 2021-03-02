const { handleMethod } = require("@rails/ujs");

$(function(){
  $('.item-button-container').on('click','.like', function(e){
    // debugger
    var str = $(".item-button-container span").text();
    if (method = post) {
      str = (+str + 1);
      });
    } else {
      str = (-str + 1);
    }
    
    $(".item-button-container span").text(str);

    });
});

// $("button").click(function(){
// 	var str = $("p").text();
// 	alert(str);
// })

// $(".item-button-container span").text(str);
//   str = (str + 1)

// .done(function(users) {
//   $("#UserSearchResult").empty();
//   if (users.length !== 0) {
//     users.forEach(function(user) {
//       addUser(user);
//     });
//   } else if (input.length == 0) {
//     return false;
//   } else {
//     addNoUser();
//   }
// })
