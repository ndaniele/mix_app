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