class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :prepare_meta_tags, if: "request.get?"

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def prepare_meta_tags(options={})
    site_name   = "Purrrsonality Test"
    title       = "Make your dreams come true!"
    description = "Find out what internet cat you are!"
    image       = options[:image] || "/assets/grumpy_cat.png"
    current_url = request.url

    defaults = {
      site:        site_name,
      title:       title,
      image:       image,
      description: description,
      keywords:    %w[cat personality test],
      og: {
        url: current_url,
        site_name: site_name,
        title: options[:title] || title,
        image: options[:image] || image,
        description: options[:description] || description,
        type: 'website'
      }
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end
end
