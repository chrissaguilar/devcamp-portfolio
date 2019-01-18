module PagesHelper
  def twitter_parser tweet
    regex = %r{
      \b
      (
        (?: [a-z][\w-]+:
         (?: /{1,3} | [a-z0-9%] ) |
          www\d{0,3}[.] |
          [a-z0-9.\-]+[.][a-z]{2,4}/
        )
        (?:
         [^\s()<>]+ | \(([^\s()<>]+|(\([^\s()<>]+\)))*\)
        )+
        (?:
          \(([^\s()<>]+|(\([^\s()<>]+\)))*\) |
          [^\s`!()\[\]{};:'".,<>?«»“”‘’]
        )
      )
    }ix

    tweet.gsub(regex) do |url|
      "<a href='#{url}' target='_blank'>#{url}</a>"
    end.html_safe
  end
end

# "henningamy: Day 9: Finished up the simple RESTful #API from yesterday, and read some more articles on APIs. Things are making m… <a href=https://t.co/tMrbTOx4w9 target='_blank'>https://t.co/tMrbTOx4w9</a>"


# tweet = "henningamy: Day 9: Finished up the simple RESTful #API from yesterday, and read some more articles on APIs. Things are making m… https://t.co/tMrbTOx4w9"