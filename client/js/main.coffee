navList = new Meteor.Collection 'nav_list'
Questions = new Meteor.Collection 'questions'

Meteor.startup(() ->
  navInit()
  questionInit()
)