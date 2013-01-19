var fbSdkLoader = function() {
  if(!Session.get("is Facebook JDK loaded?")) { // Load Facebook JDK only once.
    Session.set("is Facebook JDK loaded?", true);

    // See Facebook JavaScript JDK docs at: https://developers.facebook.com/docs/reference/javascript/
    window.fbAsyncInit = function() {
      // Init the FB JS SDK
      var initConfig = {
        appId: 291275310995056,
        // App ID from the App Dashboard
        channelUrl: Meteor.absoluteUrl("channel.html"),
        // channel url for FB
        status: false,
        // check the login status upon init?
        cookie: false,
        // set sessions cookies to allow your server to access the session?
        xfbml: false // parse XFBML tags on this page?
      };

      FB.init(initConfig);

      // Sync Facebook login status with this app login status (automatically logging in if necessary).
      FB.getLoginStatus(function(response) {
        if(response.status === 'connected') {
          Session.set('accessToken', response.authResponse.accessToken);
        } else if(response.status === 'not_authorized') {
          // not_authorized
        } else {
          // not_logged_in
        }
      });
    };

    // Load the SDK's source Asynchronously
    (function(d, debug) {
      var js, id = 'facebook-jssdk',
        ref = d.getElementsByTagName('script')[0];
      if(d.getElementById(id)) {
        return;
      }
      js = d.createElement('script');
      js.id = id;
      js.async = true;
      js.src = "//connect.facebook.net/en_US/all" + (debug ? "/debug" : "") + ".js";
      ref.parentNode.insertBefore(js, ref);
    }(document, /*debug*/ false));
  }
}