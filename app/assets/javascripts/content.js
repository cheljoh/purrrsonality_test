function renderQuestions(){
  $(".information").html();
  for (i = minQuestion; i <= maxQuestion; i++){
    var number1 = (questions[i].id + '-1');
    var number2 = (questions[i].id + '-2');
    var number3 = (questions[i].id + '-3');
    var number4 = (questions[i].id + '-4');
    var number5 = (questions[i].id + '-5');
    var group = (questions[i].id);
  $(".questions")
    .append(
      "<div id=question-" + group + ">"  +
        "<div class='row'>" +
          "<div class='col s6 form-question'>" +
            questions[i].question +
          "</div>" +
          "<div class='col s6 right-align'>" +
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
              "<label for='" + number3 + "'> 3 </label>" +
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
        "</div>" +
      "</div>");
  }
  nextButton(group);
}

function nextButton(group){
  if (group < 50){
    $(".questions")
    .append(
      "<div class='center-align'><button class='next button btn cyan accent-4'>Next!</button></div>");
  }
}

function submitButton(){
  $(".information")
  .append(
    "<div class='center-align'><button class='submit button btn cyan accent-4'>Submit!</button></div>");
}

function questionOptions() {
  $(".information")
    .prepend(
      "<div class='center-align'>" +
        "<p class='question-options'> 1 = Inaccurate <span class='tab-space'> 2 = Somewhat Inaccurate </span> <span class='tab-space'> 3 = Neutral </span> <span class='tab-space'> 4 = Somewhat Accurate </span> <span class='tab-space'> 5 = Accurate</p></span>" +
      "</div>" +
      "<br>");
}

function catMatchInfo(cat){
  return "<div class='cat-results-picture'>" +
    "<h3>Your Internet Cat Match is...</h3>" +
    "<h4>" + cat.name + "</h4>" +
    cat.picture +
    "<p class='cat-description'>" + cat.description + "</p>" +
  "</div><br><br><br>";
}

function facebookButton(){
  $(".facebook")
  .append(
    "<br><div class='center-align'><button class='facebook-button button btn cyan accent-4'>Share on Facebook!</button></div><br>");
}

function getCat(response){
  var cat = {};
  var attribute = getAttribute(response);
  if (attribute == "extraversion") {
    cat = { name: "Keyboard Cat", picture: "<iframe src='//giphy.com/embed/10RhccNxPSaglW' width='480' height='348' frameBorder='0' class='giphy-embed' allowFullScreen></iframe><p><a href='http://giphy.com/gifs/keyboard-cat-10RhccNxPSaglW'>via GIPHY</a></p>", description: "You are the life of the party! You also enjoy playing the keyboard and wearing blue shirts." };
  }
  else if (attribute == "low_agreeableness"){
    cat = {name: 'Grumpy Cat', picture: "<img src='/assets/grumpy_cat_large.jpg' alt='Grumpy Cat'>", description: "You hate...most things. But sleep and food are cool."};
  }
  else if (attribute == "agreeableness"){
    cat = { name: "Lil Bub", picture: "<img src = '/assets/lil_bub.jpg' alt='Lil Bub'>", description: "You are trusting and love to lap milk" };
  }
  else if (attribute == "emotional_stability"){
    cat = { name: "Shironeko", picture: "<img src = '/assets/shironeko.jpg' alt='Shironeko'>", description: "You are super chill and don't mind having things placed on your head" };
  }
  else if (attribute == "intellect"){
    cat = { name: "Newspaper Kitteh", picture: "<img src = '/assets/smart_cat.jpg'>", description: "You are inquisitive and embody a curious cat. Just don't get killed!" };
  }
  else if (attribute == "conscientiousness"){
    cat = { name: "Colonel Meow", picture: "<img src = '/assets/colonel_meow.jpeg'>", description: "You are organized and get shit done. And look really cool while doing it." };
  }
  return cat;
}

function resultCards(response){
  return "<div class='row'>" +
      "<h4 class='center-align'>FIVE FACTOR PERSONALITY TEST RESULTS</h4>" +
     "<div class='col s6'>" +
       "<div class='card-panel pink lighten-2'>" +
         "<span class='white-text'>" +
           "<p class='factor-title'>Extraversion:  " + response.extraversion + "/50</p>" +
           "<p>A score of " + response.extraversion + " is considered " + rateScore(response.extraversion) + ". Extraversion measures the degree people seek the presence of others. A high score is associated with attention-seeking, while a low score is associated with increased self-reflection.</p>" +
         "</span>" +
        "</div>" +
      "</div>" +
     "<div class='col s6'>" +
       "<div class='card-panel purple lighten-2'>" +
         "<span class='white-text'>" +
           "<p class='factor-title'>Conscientiousness: " + response.conscientiousness + "/50</p>" +
           "<p>A score of " + response.conscientiousness + " is considered " + rateScore(response.conscientiousness) + ". Conscientiousness measures organization. Individuals with a high score may be seen as obsessive, while individudals with a low score may be more spontaneous but less dependable.</p>" +
        "</span>" +
      "</div>" +
    "</div>" +
  "</div>" +
  "<div class='row'>" +
     "<div class='col s6'>" +
       "<div class='card-panel green lighten-2'>" +
        "<span class='white-text'>" +
          "<p class='factor-title'>Intellect/Imagination:  " + response.intellect + "/50</p>" +
          "<p>A score of " + response.intellect + " is considered " + rateScore(response.intellect) + ". Intellect measures one's curiosity and imagination. Individuals with high scores are more likely to seek extreme experiences (e.g., skydiving), while individudals with low scores are more pragmatic. </p>" +
        "</span>" +
      "</div>" +
    "</div>" +
     "<div class='col s6'>" +
       "<div class='card-panel cyan lighten-2'>" +
        "<span class='white-text'>" +
          "<p class='factor-title'>Emotional Stability:  " + response.emotional_stability + "/50</p>" +
          "<p>A score of " + response.emotional_stability + " is considered " + rateScore(response.emotional_stability) + ". Emotional stability measures the tendency to experience unpleasant emotions. Calm personalities are associated with high scores, while excitable personalities are associated with low scores.</p>" +
        "</span>" +
      "</div>" +
    "</div>" +
  "</div>" +
  "<div class='row'>" +
    "<div class='col s6'>" +
      "<div class='card-panel orange lighten-2'>" +
      "<span class='white-text'>" +
        "<p class='factor-title'>Agreeableness:  " + response.agreeableness + "/50</p>" +
        "<p>A score of " + response.agreeableness + " is considered " + rateScore(response.agreeableness) + ". Agreeabless measures how trusting and cooperative one is. A high score is associated with naivete, while individuals with low scores may be perceived as competitive or not trusting of others.</p>" +
      "</span>" +
      "</div>" +
    "</div>" +
     "<div class='col s6'>" +
       "<div class='card-panel'>" +
        "<image src='/assets/grumpy_cat.png'> <b>You - 0/50<b></image>" +
      "</div>" +
    "</div>" +
  "</div>";
}
