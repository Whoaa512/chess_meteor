Meteor.startup( ->

  # serve channel.html file programmatically
  connect = __meteor_bootstrap__.require("connect")

  __meteor_bootstrap__.app.use(connect.query()).use( (req, res, next) ->
    # Need to create a Fiber since we're using synchronous http
    # calls and nothing else is wrapping this in a fiber
    # automatically
    Fiber( ->
      if req.url == "/fb/channel.html"
        res.writeHead 200, {'Content-Type': 'text/html'}
        res.end '<script src="//connect.facebook.net/en_US/all.js"></script>'
      else
        # // not an channel.html request. pass to next middleware.
        next()
    ).run()
  )

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

  # Initializations
  collectionInit()
  accountsInit() # defined in share_resources.coffee

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
