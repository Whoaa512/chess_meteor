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

  if !Accounts.loginServicesConfigured
    Accounts.loginServiceConfiguration
      .remove
        service: "facebook"

    Accounts.loginServiceConfiguration
      .insert
        service: "facebook"
        appId: "291275310995056"
        secret: "22647284cca9d55b326c1497ad8a1dee"
)
