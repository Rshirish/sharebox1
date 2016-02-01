module UsersHelper

	def gravatar(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://www.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.email, class: "gravatar")
  end
end
