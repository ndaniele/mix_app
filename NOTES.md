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

X add a new model, User (has email)


    X DB change
      create table for :user, 
        t.string: email

    X URL change
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


     X a user has_many questions (which the user created)
        X user.questions (lists all questions a user has created (/ or answered)
       X User 
       X has_many :questions

      X  Question
      X    belongs_to :user (add user_id to question table)

      X  Answers
       X   join table
        X  (belongs_to user, belongs_to question)

TO DO TODAY (aug. 17, 2016)

X look into creating a user.
X add omniauth for github

X add user/questions/show (show page displaying all questions created by a user)

X make a link to all questioned that have been answered by a user
  (user_answers path??) ...maybe it also goes to the show page and breaks into categories there? questions you have created / ...you have answered.

TO DO (Aug. 19, 2016)
X make one answer per user per question (user can only answer a question one time) - limit on create action (check if user id exists in db? if no => create, if yes => error message)

X refactor / clean up code 

X flash messages for errors

TO DO 

X merge current version with github repo (do i need to rename?)

(- add omniauth for github, twitter)



TO DO FOR ASSESMENT
X change relationship to has_many_through

- add authorization roles for User
  - User can only destroy questions created by User
  - User can answer all questions

- possibly add a .most_popular_question class method
- 


ADD PUNDIT (Sept. 30, 2016)
- pretend that the main site is already group specific (i.e. that what you are seeing are the questions that belong to your group.)
- add permissions
  - a user can only answer questions within their own group. 
  -this isn't gonna work. i need to add the group manually first. 

  ADD GROUPS + MEMBERSHIPS
  X add migration and model for group
  X add migration and model for membership
  X add group controller
  X add group creation function to site
  X add membership controller (?)
  X add membership function to site

  ADD GROUP QUESTIONS
  X associate questions to a group
  X add column group_id to questions table

  ADD GROUP UPDATE 
  X be able to change the name of a group

  ADD VALIDATIONS
  - a single user can only join a single group once
  - user who creates a group is group admin
  - only group admin can change the name of a group
  - Questions can be marked private (for groups only) or public (group 0)
  

JS VERSION REQ.
[?] Must render at least one index resource/page via jQuery and an Active Model Serialization JSON Backend.
  - all links on home page?

[?] Must render at least one show resource/page via jQuery and an Active Model Serialization JSON Backend.
  - all links on home page?

[X] The rails API must reveal at least one has-many relationship in the JSON that is then rendered to the page.
  - class QuestionSerializer < ActiveModel::Serializer
    attributes :id, :query, :user_id
    has_many :answers
    end


[] Must use your Rails API and a form to create a resource and render the response without a page refresh.
  - /questions/new #=> renders new question to page without refresh or redirect
  - via JSON 

[?] Must translate the JSON responses into Javascript Model Objects. The Model Objects must have at least one method on the prototype. Formatters work really well for this.
  have a 
  function(Question) 
    format
    Qustion.prototype.function format() {
    return this.author.firstName + ' ' + this
  }
  'Question: ' + question.format()

  test test 

  

  

