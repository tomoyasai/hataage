// const { handleMethod } = require("@rails/ujs");

$(function(){
  $('.item-button-container').on('click','.unlike', function(e){
    let str = $(".item-button-container span").text();
    // debugger
  
    
      str = +str + 1;
  
    $(".item-button-container span").text(str);
    });

    $('.item-button-container').on('click','.liked', function(e){
      let str = $(".item-button-container span").text();
      // debugger
    
      
        str = +str -1;
    
      $(".item-button-container span").text(str);
      });
 });


//＋strの＋は文字を数値にする意味がある