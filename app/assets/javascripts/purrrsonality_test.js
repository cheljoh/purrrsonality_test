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
    success: function(response){ //will get response back
      // console.log("it worked")
      // console.log(response)//get results
      $(".questions").hide()
      showResults(response)
    },
    error: function(){
    console.log("Something went wrong")
    }
  })
}

function showResults(response) {
  $(".information")
    .html(
      "<div class='cat-results-picture'>" +
        "<h3>Your Internet Cat Match is...</h3>" +
        "<h4>GRUMPY CAT!!!</h4>" +
        "<img src='https://s-media-cache-ak0.pinimg.com/736x/8a/40/b9/8a40b946c47fa2e2db704593ba38d4df.jpg'>" +
        "<p class='cat-description'>You are stubborn to a fault and hate Mondays. But, you know how to treat your friends well.</p>" +
      "<div><br>" +
      "<br><div class='center-align'><button class='facebook button btn cyan accent-4'>Share on Facebook!</button></div><br><br>")
  $(".information")
  .append(
    resultCards(response))
}

function rateScore(score){
  if (score < "17") {
    rating = "low"
  }
  else if (score < "34") {
    rating = "moderate"
  }
  else {
    rating = "high"
  }
  return rating
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
  $(".information").html()
  questionOptions()
  $(questions).each(function(index, test_question){
    var number1 = (test_question.id + '-1')
    var number2 = (test_question.id + '-2')
    var number3 = (test_question.id + '-3')
    var number4 = (test_question.id + '-4')
    var number5 = (test_question.id + '-5')
    var group = (test_question.id)
  $(".information")
    .append(
      "<div class='row'>" +
        "<div class='col s5 offset-s1'>" +
          test_question.question +
        "</div>" +
        "<div class='col s5 offset-s1'>" +
          "<div class='responses'>" +
            "<input name='" + group + "' value = '1' type='radio' id='" + number1 + "'/>" +
            "<label for='" + number1 + "'>1</label>" +
          "</div>" +
          "<div class='responses'>" +
            "<input name='" + group + "' value = '2' type='radio' id='" + number2 + "'/>" +
            "<label for='" + number2 + "'>2</label>" +
          "</div>" +
          "<div class='responses'>" +
            "<input name='" + group + "' value = '3' type='radio' id='" + number3 + "' />" +
            "<label for='" + number3 + "'>3</label>" +
          "</div>" +
          "<div class='responses'>" +
            "<input name='" + group + "' value = '4' type='radio' id='" + number4 + "' />" +
            "<label for='" + number4 + "'>4</label>" +
          "</div>" +
          "<div class='responses'>" +
            "<input name='" + group + "' value = '5' type='radio' id='" + number5 + "' />" +
            "<label for='" + number5 + "'>5</label>" +
          "</div>" +
        "</div>" +
      "</div>")
  })
  $(".information")
  .append("<br><div class='center-align'><button class='submit button btn cyan accent-4'>Submit!</button></div><br><br>")
}

function questionOptions() {
  $(".information")
    .append(
      "<div class='center-align'>" +
        "<p> 1 = Inaccurate <span class='tab-space'> 2 = Somewhat Inaccurate </span> <span class='tab-space'> 3 = Neutral </span> <span class='tab-space'> 4 = Somewhat Accurate </span> <span class='tab-space'> 5 = Accurate</p></span>" +
      "</div>" +
      "<br>")
}

function hideButton(){
  $("button[name=get-questions]").hide()
}

function resultCards(response){
  return "<div class='row'>" +
      "<h4 class='center-align'>FIVE FACTOR PERSONALITY TEST RESULTS</h4>" +
     "<div class='col s4 offset-s1'>" +
       "<div class='card-panel pink lighten-2'>" +
         "<span class='white-text'>" +
           "<p class='factor-title'>Extraversion:  " + response["extraversion"] + "/50</p>" +
           "<p>A score of " + response["extraversion"] + " is considered " + rateScore(response["extraversion"]) + ". Extraversion measures the degree people seek the presence of others. A high score is associated with attention-seeking, while a low score is associated with increased self-reflection.</p>" +
         "</span>" +
        "</div>" +
      "</div>" +
     "<div class='col s4 offset-s1'>" +
       "<div class='card-panel purple lighten-2'>" +
         "<span class='white-text'>" +
           "<p class='factor-title'>Conscientiousness: " + response["conscientiousness"] + "/50</p>" +
           "<p>A score of " + response["conscientiousness"] + " is considered " + rateScore(response["conscientiousness"]) + ". Conscientiousness measures organization. Individuals with a high score may be seen as obsessive, while individudals with a low score may be more spontaneous but less dependable.</p>" +
        "</span>" +
      "</div>" +
    "</div>" +
  "</div>" +
  "<div class='row'>" +
     "<div class='col s4 offset-s1'>" +
       "<div class='card-panel green lighten-2'>" +
        "<span class='white-text'>" +
          "<p class='factor-title'>Intellect/Imagination:  " + response["intellect"] + "/50</p>" +
          "<p>A score of " + response["intellect"] + " is considered " + rateScore(response["intellect"]) + ". Intellect measures one's curiosity and imagination. Individuals with high scores are more likely to seek extreme experiences (e.g., skydiving), while individudals with low scores are more pragmatic. </p>" +
        "</span>" +
      "</div>" +
    "</div>" +
     "<div class='col s4 offset-s1'>" +
       "<div class='card-panel cyan lighten-2'>" +
        "<span class='white-text'>" +
          "<p class='factor-title'>Emotional Stability:  " + response["emotional_stability"] + "/50</p>" +
          "<p>A score of " + response["emotional_stability"] + " is considered " + rateScore(response["emotional_stability"]) + ". Emotional stability measures the tendency to experience unpleasant emotions. Calm personalities are associated with high scores, while excitable personalities are associated with low scores.</p>" +
        "</span>" +
      "</div>" +
    "</div>" +
  "</div>" +
  "<div class='row'>" +
    "<div class='col s4 offset-s1'>" +
      "<div class='card-panel orange lighten-2'>" +
      "<span class='white-text'>" +
        "<p class='factor-title'>Agreeableness:  " + response["agreeableness"] + "/50</p>" +
        "<p>A score of " + response["agreeableness"] + " is considered " + rateScore(response["agreeableness"]) + ". Agreeabless measures how trusting and cooperative one is. A high score is associated with naivete, while individuals with low scores may be perceived as competitive or not trusting of others.</p>" +
      "</span>" +
      "</div>" +
    "</div>" +
     "<div class='col s4 offset-s1'>" +
       "<div class='card-panel'>" +
        "<image src='http://cdn.grumpycats.com/wp-content/uploads/2012/09/GC-Gravatar-copy.png'> You - 0/50</image>" +
      "</div>" +
    "</div>" +
  "</div>"
}