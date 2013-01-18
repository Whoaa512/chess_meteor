navInit = ->
  Template.navbar.navs = ->
    navList.find()
  Template.fb_pic.user = ->
    if Meteor.user()
      true
  Template.fb_pic.pic = ->
    x = Meteor.user().profile

    # logic to handle logged out state
    if x
      x.picture
