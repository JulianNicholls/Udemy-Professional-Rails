module ApplicationHelper    # Available to all views
  def gravatar_for(chef, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest chef.email
    size        = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"

    image_tag gravatar_url, alt: chef.name, class: 'gravatar'
  end
end
