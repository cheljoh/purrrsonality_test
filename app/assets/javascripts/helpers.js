var minQuestion = 0;
var maxQuestion = 9;
var questions = [];


function hideGetQuestionsButton(){
  $("button[name=get-questions]").hide();
}

// function showResults(response) {
//   cat = getCat(response);
//   $("html, body").animate({ scrollTop: 0 }, "slow");
//     sendToRails(cat);
//   $(".information")
//     .html(
//       catMatchInfo(cat));
//   $(".information")
//   .append(
//     resultCards(response));
//   facebookButton();
// }

function sendToRails(cat){
  $.post("/results?cat=" + cat.name);
}

function incrementQuestionCounter() {
  hideFlash();
  hidePreviousQuestions();
  minQuestion += 10;
  maxQuestion += 10;
  if (maxQuestion == 49){
    submitButton();
  }
  renderQuestions();
}

function hideFlash(){
  $(".flash").hide();
}

function hideSubmitButton(){
  $(".submit").hide();
}

function hidePreviousQuestions() {
  for (i = minQuestion; i <= maxQuestion; i++){
    question_id = "#question-" + (i + 1);
    $(question_id).toggle();
  }
  $(".next").hide();
}

function showFlash(){
  $(".flash").show();
}

function getAttribute(response){
  var highest = 0;
  var trait;
  if (response.agreeableness < 17) {
    trait = "low_agreeableness";
  }
  else {
    $.each(response, function(key, value){
      if (value > highest){
        highest = value;
        trait = key;
      }
    });
  }
  return trait;
}

function rateScore(score){
  if (score < "17") {
    rating = "low";
  }
  else if (score < "34") {
    rating = "moderate";
  }
  else {
    rating = "high";
  }
  return rating;
}
