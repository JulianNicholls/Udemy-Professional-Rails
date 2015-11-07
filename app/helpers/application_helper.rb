# Helper functions for views
module ApplicationHelper
  def gravatar_for(chef, options = { size: 80 })
    g_id  = Digest::MD5.hexdigest chef.email
    size  = options[:size]
    g_url = "https://secure.gravatar.com/avatar/#{g_id}?s=#{size}"

    image_tag g_url, alt: chef.name, class: 'gravatar'
  end
end
