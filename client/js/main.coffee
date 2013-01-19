Meteor.subscribe "fbAccessToken"
Meteor.subscribe "questions"
Meteor.subscribe "nav_list"


Meteor.startup ->
  Meteor.Router.add
    '/'           : 'homePage'
    '/questions'  : 'questions_list'
    '*'           : 'not_found'

  fbSdkLoader()
  navInit()
  questionInit()
  Meteor.Router.to '/'
