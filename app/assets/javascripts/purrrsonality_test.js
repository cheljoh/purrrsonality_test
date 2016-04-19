$(document).ready(function(){
  $("button[name=get-cat]").on("click", getRandomCat);
});

function getRandomCat(){
  $.ajax({
    url: "http://thecatapi.com/api/images/get?size=med&format=html&type=gif",
    method: "GET",
    dataType: "html",
    success: function(picture){
      $(".cat-image")
      .html(picture)
    },
    error: function(){
    console.log("Something went wrong")
    }
  })
}
