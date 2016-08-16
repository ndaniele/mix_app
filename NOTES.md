notes:

MIX

the site ‘/‘ home page is an INDEX of questions that can be selected by a user.

clicking on a question links to a show page which has a YES or NO button, the user must click. 

clicking the YES/NO button shows Stats on the same show page. (number of views, number of yes / no, origin of question, etc. ) 


there should also be a link to create a response question. (and possibly leave a comment) 


TO DO 

#1. set up the Scaffolding for a rails site. 

#2. stub out index (‘/questions‘) action and show (‘/questions/:id‘)action. 

#3. make destroy action for questions (no need for edit action - once a question has been answered, it can't be edited, only deleted)

#4. understand how Yes/No relates to each question. …do i need a separate Answer Model? - yes

#(clicking YES or NO records that answer under the question. (i.e. Is the Sky Blue? => YES/NO, records how many yes and how many no answers so you can call Question.yes.count or question.no.count also need total answers question.answers.count))

#5. make nested resource for Answers. build out controller and models accordingly. ...make migration to add answer_id to questions table  


#6. make answers_attributes= method (look at https://learn.co/tracks/full-stack-web-development/rails/associations-and-rails/basic-nested-forms?batch_id=306&track_id=12615) 

#also, get answers attributes to successfully update questions. 

#7. show answers attributes (STATS) on question show page. 


TO DO TODAY (Aug. 13, 2016)

X make answers be destroyed when question is destroyed. 
X make correct helper method for stats
X add a create a new question link to home page
X make '/' root path
X nest routes
X change redirect for answered question to question_answers show page
X get rid of LIMIT 1 on SQL calls for yeses = question.answers.find_by(input: "yes") - it is screwing up my yes_count method

TO DO (Aug. 15, 2016)
X change posting to answers#show from answers#index?
X validate question (must have a query, cannot be blank)
X validate answer (:input cannot be blank) 
X change form_for to form_tags? ..the loop is causing the problem
  problem is: form objects are being created for all answer objects already associated with a question. 
  soulution: make a new form for a new association ONLY. 

TO DO TODAY (Aug. 16, 2016)

- add a new model, User (has email)


    - DB change
      create table for :user, 
        t.string: email

    URL change
      - GET '/users/new' #=> UsersController#new
        - sign up form
      - POST '/users'
        - creates a new user #=> UsersController#create

      - GET '/login' #=> SessionsController#new
        - form
      - POST '/sessions' #=> SessionsController#create
        - logs a user into the site

    - Model structure 

      a user has_many authored questions
      a user has_many answered questions


      a user has_many questions (which the user created)
        - user.questions (lists all questions a user has answered)
        User 
        has_many :questions

        Question
          belongs_to :user (add user_id to question table)

        Answers
          join table


- look into creating a user.
- make one answer per user per question (CREATE USERS??)

