var results;

$(document).ready(function(){
  $("button[name=get-cat]").on("click", getRandomCat);
  $("button[name=get-questions]").on("click", getQuestions);
  $("body").on("click", "button.submit", postData);
  $("body").on("click", "input:radio", radioInput);
});

function radioInput() {
  if (typeof results == "undefined") { //check to make sure there are 50  keys, corresponds to a number
    results = {} //clean up methods, make "take a test" disappear, make test disappear after submit. Capybara personality test?
  }
  var questionId = $(this).attr('name')
  var answerValue = $(this).attr('value')
  results[questionId] = answerValue
}

function postData(){


  //check for keys if present, do ajax, else, reload
  var location = "http://localhost:8888/"
  var post_data = { "answers": results, "location": location }
  $.ajax({
    url: "http://localhost:3000/api/v1/answers",
    method: "POST",
    dataType: "json",
    data: post_data,
    // data: all_answers,
    success: function(response){ //will get response back
      console.log("it worked")
      console.log(response)//get results
      $(".questions").hide()
    },
    error: function(){
    console.log("Something went wrong")
    }
  })
}

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
      renderQuestions(questions)
      hideButton()
    },
    error: function(){
    console.log("Something went wrong")
    }
  })
}

function renderQuestions(questions){
  $(".questions").html()
  questionOptions()
  $(questions).each(function(index, test_question){
    var number1 = (test_question.id + '-1')
    var number2 = (test_question.id + '-2')
    var number3 = (test_question.id + '-3')
    var number4 = (test_question.id + '-4')
    var number5 = (test_question.id + '-5')
    var group = (test_question.id)
  $(".questions")
    .append("<div class='row'> <div class='col s5 offset-s1'>" + test_question.question + "</div> <div class='col s5 offset-s1'><div class='responses'> <input name='" + group + "' value = '1' type='radio' id='" + number1 + "'/> <label for='" + number1 + "'>1</label> </div> <div class='responses'> <input name='" + group + "' value = '2' type='radio' id='" + number2 + "'/> <label for='" + number2 + "'>2</label> </div> <div class='responses'> <input name='" + group + "' value = '3' type='radio' id='" + number3 + "' /> <label for='" + number3 + "'>3</label> </div> <div class='responses'> <input name='" + group + "' value = '4' type='radio' id='" + number4 + "' /> <label for='" + number4 + "'>4</label> </div> <div class='responses'> <input name='" + group + "' value = '5' type='radio' id='" + number5 + "' /> <label for='" + number5 + "'>5 </label> </div> </div></div>")
  })
  $(".questions")
  .append("<br><div class='center-align'><button class='submit button btn cyan accent-4'>Submit!</button></div><br><br>")
}

function questionOptions() {
  $(".questions")
    .append("<div class='center-align'><p> 1 = Inaccurate <span class='tab-space'> 2 = Somewhat Inaccurate </span> <span class='tab-space'> 3 = Neutral </span> <span class='tab-space'> 4 = Somewhat Accurate </span> <span class='tab-space'> 5 = Accurate</p></space></div> <br>")
}

function hideButton(){
  $("button[name=get-questions]").hide()
}
