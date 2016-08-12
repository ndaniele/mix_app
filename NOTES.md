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

8. make one answer per user per question (CREATE USERS??)

9. Stop multiple buttons (forms) appearing on reloaded show page