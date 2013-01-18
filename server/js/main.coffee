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

  # during new account creation get user picture from facebook and save in user object
  Accounts.onCreateUser (options, user) ->
    if (options.profile)
      options.profile.picture = getFbPicture( user.services.facebook.accessToken )

      # We still want the default hook's 'profile' behavior.
      user.profile = options.profile;
    return user


  getFbPicture = (accessToken) ->
    result = Meteor.http.get "https://graph.facebook.com/me",
      params:
        access_token: accessToken
        fields: 'picture'

    if(result.error)
      throw result.error

    return result.data.picture.data.url
)
