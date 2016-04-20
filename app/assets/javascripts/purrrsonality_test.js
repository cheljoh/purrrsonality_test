$(document).ready(function(){
  $("button[name=get-cat]").on("click", getRandomCat);
  $("button[name=get-questions]").on("click", getQuestions);
});

function getRandomCat(){
  $.ajax({
    url: "https://thecatapi.com/api/images/get?size=med&format=html&type=gif",
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

function getQuestions(){
  // $.getJSON("http://localhost:3000/api/v1/questions"), function(questions) {
  //   console.log(questions)
  // }
  $.ajax({
    url: "http://localhost:3000/api/v1/questions",
    method: "GET",
    dataType: "json",
    success: function(questions){
      $(".questions").html()
      $(".questions")
        .append("<p> 1 = Inaccurate  2 = Somewhat Inaccurate  3 = Neutral  4 = Somewhat Accurate  5 = Accurate</p>")
      $(questions).each(function(index, question){
        var number = (index * 5 + 1)
      $(".questions")
        // .append("<p>" + question[index + 1] + "</p> <form action='#'> <div class='responses'> <input name='group' type='radio' id='1'/> <label for='1'>1</label> </div> <div class='responses'> <input name='group' type='radio' id='2' /> <label for='2'>2</label> </div> <div class='responses'> <input name='group' type='radio' id='3' /> <label for='3'>3</label> </div> <div class='responses'> <input name='group' type='radio' id='4' /> <label for='4'>4</label> </div> <div class='responses'> <input name='group' type='radio' id='5' /> <label for='5'>5</label> </div> </form>")
        .append("<p>" + question[index + 1] + "</p> <form action='#'> <div class='responses'> <input name='group' type='radio' id=" + (index * 5 + 1) + "/> <label for=" + (index * 5 + 1).toString() + ">1</label> </div> <div class='responses'> <input name='group' type='radio' id='2' /> <label for='2'>2</label> </div> <div class='responses'> <input name='group' type='radio' id='3' /> <label for='3'>3</label> </div> <div class='responses'> <input name='group' type='radio' id='4' /> <label for='4'>4</label> </div> <div class='responses'> <input name='group' type='radio' id='5' /> <label for='5'>5</label> </div> </form>")
      })
    },
    error: function(){
    console.log("Something went wrong")
    }
  })
}
