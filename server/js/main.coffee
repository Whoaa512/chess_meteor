Meteor.startup( ->
  collectionInit()

  # published DB collections
  Meteor.publish(
      "fbAccessToken",
      -> Meteor.users.find(
        this.userId,
        {fields: {"services.facebook.accessToken": 1}}))
  Meteor.publish(
    'questions',
    -> Questions.find({}))
  Meteor.publish(
    'nav_list',
    -> navList.find {}, {fields: {'title':1, 'url':1}} )

  # defined in share_resources.coffee
  accountsInit()
)

Meteor.methods
  getFbPicture : ->
    fut = new Future()
    fut.ret(Meteor.http.get("https://graph.facebook.com/me",
          params:
            access_token: Meteor.user().services.facebook.accessToken
            fields: 'picture',
          (err, res) -> res.content.picture.data.url))
    fut.wait()

    ## figure out futures!!!!!!!!! and get my FB PIC