navInit = ->
  Template.navbar.navs = ->
    navList.find()
  Template.fb_pic.pic = ->
    x = Meteor.user().profile

    # logic to handle logged out state
    if x
      x.picture
    else
      console.log("Not logged in, no picture to load.")