function Question(id, query, user_id) {
    this.id = id;
    this.query = query;
    this.user_id = user_id;
}


var answerStats = function(answers, id) {
   $.each(answers, function(index, answer){
      var yesArry = [];
      var noArry = [];
       if (answer.input === "yes") {
        yesArry.push(answer);
       } else if (answer.input === "no") {
        noArry.push(answer);
      };
      var html = ''
      if (yesArry.length === noArry.length) {
        html += '<p>' + "Its A Tie!" 
    //debugger
      } else if (noArry.length > yesArry.length) {
        html += '<p>' + "Winner is NO" 
      } else if (yesArry.length > noArry.length) {
        html += '<p>' + "Winner is Yes" 
     };
      $('.questions-group-' + id).append(html);
  });
}


var eachGroup = function(groups) {
  groups.forEach(function(group) {
    html = ''
    html += '<li>' + group.id + ". " + group.name
    html += '<li><button class="js-more" data-id="' + group.id + '">Questions For This Group</button><li>'
    html += '<li class="questions-for-group-' + group.id + '">'

    $('.allGroups').append(html)  
  });
}



var groupQuestionAnswers = function () {
  $(".js-more").on('click', function() {
  // get the id from the data attribute
   var id = parseInt($(".js-more").attr("data-id"));
   //debugger
  //var id = $(this).data("id");
  $.get(" /groups/" + id + ".json", function(data) {
    var group_questions = data.group.questions.forEach(function(question) {
      html = ''
      html += '<li> ¿' + question.query + '?'
      $('.questions-for-group-' + id).append(html)

      var answers = question.answers

      answerStats(answers, id);

      });                     
    });
  });
};

  var createNewGroup = function () {
    $('form').submit(function(event) {
      //prevent form from submitting the default way
      event.preventDefault();
      var values = $(this).serialize();
      
      var posting = $.post('/groups', values);
 
      posting.done(function(data) {
        //console.log(data);

        var group = data["group"];

        $("#groupTitle").text(group["name"]);   
      });    
    });
  };


  var myQuestionsClick = function () {
  $(".my-questions").on("click", function() {
    var id = parseInt($(".js-next").attr("data-id"));
    $.get("/users/" + id + ".json", function(data) {
      //console.log(data.user);
      var user_questions = data.user.questions
//var eachGroup = function(groups) {
      user_questions.forEach(function(question) {
        html = ''
        html += '<li>' + question.id + ". " + question.query
  // html += '<li><button class="js-more" data-id="' + group.id + '">Questions For This Group</button><li>'
//html += '<li class="questions-for-group-' + group.id + '">'
        $('.myQuestions').append(html)  
      });
    });
  });
};

var mostPopularQuestionClick = function () {
  $(".most-popular-question").on("click", function() {
    //var id = parseInt($(".js-next").attr("data-id"));
    $.get("/questions/most_popular" + ".json", function(data) {
      //console.log(data["question"]["answers"]);
      $(".mostPopularQuestion").text(data["question"]["query"]);
      var answers = data["question"]["answers"];
      var id = "A" 
      answerStats(answers, id);
    });
  });
};

var allGroupsClick = function () {
  $(".all-groups").on("click", function() {
    var id = parseInt($(".js-next").attr("data-id"));
    $.get("/groups" + ".json", function(data) {
      //console.log(data.groups);
      var groups = data.groups
      //$(".main").html(data);
      eachGroup(groups);
      groupQuestionAnswers();
    });
  });
};

var myGroupsClick = function () {
  $(".my-groups").on("click", function() {
    $.get("/groups/my_groups" + ".json", function(data) {
      var memberships = data.groups 

      $.each(memberships, function(index, membership){

        var group_id = membership.group_id

        var html = ''
        html += '<p>' + "You belong to group id: " + group_id 
        $(".my-groups").append(html);  
      //$(".main").text(html);
      });
    });
  });
};