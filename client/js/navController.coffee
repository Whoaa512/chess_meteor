navInit = ->
  Template.navbar.navs = ->
    navList.find()
  Template.fb_pic.pic = ->
    my_pic = Meteor.call 'getFbPicture'
    console.log my_pic