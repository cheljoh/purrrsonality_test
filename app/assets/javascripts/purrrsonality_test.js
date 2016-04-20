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
  $.ajax({
    url: "http://localhost:3000/api/v1/questions", //"https://personalitytest.herokuapp.com/api/v1/questions"
    method: "GET",
    dataType: "json",
    success: function(questions){
      $(".questions").html()
      questionOptions()
      $(questions).each(function(index, test_question){
        var number1 = (test_question.id + '-1')
        var number2 = (test_question.id + '-2')
        var number3 = (test_question.id + '-3')
        var number4 = (test_question.id + '-4')
        var number5 = (test_question.id + '-5')
      $(".questions")
        .append("<div class='row'> <div class='col s5 offset-s1'>" + test_question.question + "</div> <div class='col s5 offset-s1'> <form action='#'> <div class='responses'> <input name='group' type='radio' id='" + number1 + "'/> <label for='" + number1 + "'>1</label> </div> <div class='responses'> <input name='group' type='radio' id='" + number2 + "'/> <label for='" + number2 + "'>2</label> </div> <div class='responses'> <input name='group' type='radio' id='" + number3 + "' /> <label for='" + number3 + "'>3</label> </div> <div class='responses'> <input name='group' type='radio' id='" + number4 + "' /> <label for='" + number4 + "'>4</label> </div> <div class='responses'> <input name='group' type='radio' id='" + number5 + "' /> <label for='" + number5 + "'>5</label> </div> </form> </div> </div>")
      })
    },
    error: function(){
    console.log("Something went wrong")
    }
  })
}

function questionOptions() {
  $(".questions")
    .append("<div class='center-align'><p> 1 = Inaccurate <span class='tab-space'> 2 = Somewhat Inaccurate </span> <span class='tab-space'> 3 = Neutral </span> <span class='tab-space'> 4 = Somewhat Accurate </span> <span class='tab-space'> 5 = Accurate</p></space></div> <br>")
}
