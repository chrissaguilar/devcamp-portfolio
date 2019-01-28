ready = ->
  new Typed '.element',
    strings: [
      'Thank You for visiting my site! In here you can navigate to find out more about me.'
      "Feel free to browse around and check out some Rails Tweets, create an account to share your thoughts and opinions on the blog page or even take a look at my portfolios page with projects I've worked on."
    ]
    typeSpeed: 40
  return

#$(document).ready ready
$(document).on 'turbolinks:load', ready

