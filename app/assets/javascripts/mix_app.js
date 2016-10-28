function Question(id, query, user_id, answers) {
    this.id = id;
    this.query = query;
    this.user_id = user_id;
    this.answers = answers
}


Question.protoype.answerStats = function() {
   $.each(this.answers, function(index, answer){
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
      $('.questions-group-' + this.id).append(html);
  });
}