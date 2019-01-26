module ApplicationHelper
  def login_helper(style = '')
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) +
          " ".html_safe +
          (link_to "Login", new_user_session_path, class: style)
    else
      (link_to "Logout", destroy_user_session_path, method: :delete, class: style) +
        " ".html_safe +
        (link_to 'Change Password', edit_user_registration_path, class: style)
    end
  end

  def source_helper styles
    if session[:source]
      greeting = "Thanks for visiting us from #{session[:source]}, please feel free to #{ link_to 'contact me', contact_path} if you would like to work together."
      content_tag(:div, greeting.html_safe, class: styles )
    end
  end

  def copyright_generator
    CsaViewTool::Renderer.copyright "Christopher Aguilar", "All rights reserved"
  end

  def nav_items
    [
       {
          url: root_path,
          title: "Home"
       },
       {
          url: about_me_path,
          title: 'About Me'
       },
       {
          url: contact_path,
          title: 'Contact'
       },
       {
          url: blogs_path,
          title: 'Blog'
       },
       {
          url: portfolios_path,
          title: 'Portfolio'
       },
       {
          url: tech_news_path,
          title: 'Rails Tweets'
       }

    ]
  end

  def nav_helper(style, tag_type)
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a>
</#{tag_type}>"
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end
end

def alerts
  alert = (flash[:alert] || flash[:error] || flash[:notice])

  if alert
    alert_generator alert
  end
end

def alert_generator msg
  js add_gritter(msg, :title => "Chris Aguilar Portfolio", sticky: false, time: 5000)
end

def progressbar_colors
  colors = %w(bg-primary bg-success bg-info bg-warning bg-danger)
  random_number = rand(5)
  colors[random_number]
end












# <#{tag_type}><a href="#{root_path}" class="#{style} #{active? root_path}">Home</a></#{tag_type}>
#    <#{tag_type}><a href="#{about_me_path}" class="#{style} #{active? about_me_path}">About Me</a></#{tag_type}>
#    <#{tag_type}><a href="#{contact_path}" class="#{style} #{active? contact_path}">Contact</a></#{tag_type}>
#    <#{tag_type}><a href="#{blogs_path}" class="#{style} #{active? blogs_path}">Blog</a></#{tag_type}>
#    <#{tag_type}><a href="#{portfolios_path}" class="#{style} #{active? portfolios_path}">Portfolio</a></#{tag_type}>