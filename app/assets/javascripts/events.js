$(document).ready(function(){
  $("button[name=get-cat]").on("click", getRandomCat);
  $("button[name=get-questions]").on("click", getQuestions);
  $("body").on("click", "input:radio", radioInput);
  $("body").on("click", "button.submit", postData);
  $("body").on("click", "button.next", checkCompletion);
  $("body").on("click", "button.facebook-button", shareLink);
});

function getRandomCat(){
  $.ajax({
    url: "https://thecatapi.com/api/images/get?size=med&format=html&type=gif",
    method: "GET",
    dataType: "html",
    success: function(picture){
      $(".cat-image")
      .html(picture);
    },
    error: function(){
    console.log("Something went wrong");
    }
  });
}

function getQuestions(){
    hideGetQuestionsButton();
  $.ajax({
    url: "https://personalitytest.herokuapp.com/api/v1/questions",
    method: "GET",
    dataType: "json",
    beforeSend: function(){
      $('.circle').show();
    },
    success: function(test_questions){
      questions = test_questions;
      renderQuestions();
      questionOptions();
      $('.circle').hide();
    },
    error: function(){
    console.log("Something went wrong");
    }
  });
}

function radioInput() {
  if (typeof results == "undefined") {
    results = {};
  }
  var questionId = $(this).attr('name');
  var answerValue = $(this).attr('value');
  results[questionId] = answerValue;
}

function postData(){
  if (Object.keys(results).length != 50) {
    $(".flash").show();
    $("html, body").animate({ scrollTop: 0 }, "slow");
  }
  else {
    hideFlash();
    var location = "https://purrrsonalitytest.herokuapp.com/";
    var post_data = { "answers": results, "location": location };
    hideSubmitButton();
    $.ajax({
      url: "https://personalitytest.herokuapp.com/api/v1/answers",
      method: "POST",
      dataType: "json",
      data: post_data,
      success: function(response){
        $(".questions").hide();
        showResults(response);
      },
      error: function(){
      console.log("Something went wrong");
      }
    });
  }
}

function checkCompletion(){
  if (typeof results == "undefined" || Object.keys(results).length != (maxQuestion + 1)) {
    showFlash();
    $("html, body").animate({ scrollTop: 0 }, "slow");
  }
  else {
    incrementQuestionCounter();
  }
}

function shareLink(){
  var fbpopup = window.open("https://www.facebook.com/sharer/sharer.php?u=https://purrrsonalitytest.herokuapp.com/" + cat.name, "pop", "width=600, height=400, scrollbars=no");
    return false;
}
