Meteor.subscribe "fbAccessToken"
Meteor.subscribe "questions"
Meteor.subscribe "nav_list"


Meteor.startup ->
  Meteor.Router.add
    '/'           : 'homePage'
    '/questions'  : 'questions_list'
    '/ask'        : 'ask_req'
    '*'           : 'not_found'

  navInit()
  questionInit()
  Meteor.Router.to '/'
