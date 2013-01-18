Meteor.subscribe "fbAccessToken"
Meteor.subscribe "questions"
Meteor.subscribe "nav_list"


Meteor.startup ->
  Meteor.Router.add
    '/'           : 'homePage'
    '/questions'  : 'questions_list'
    '*'           : 'not_found'

  navInit()
  questionInit()
  Meteor.Router.to '/'

getFbPicture =  ->
  result = Meteor.http.get("https://graph.facebook.com/me",
    params:
      access_token: Meteor.user().services.facebook.accessToken
      fields: 'picture',
    (err, res) -> console.log(res))
