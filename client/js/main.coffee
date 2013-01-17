navList = new Meteor.Collection 'nav_list'
Questions = new Meteor.Collection 'questions'

Meteor.startup(() ->
  Meteor.Router.add {
    '/'           : '/'
    '/questions'  : 'questions_list'
  }

  navInit()
  questionInit()
)
