module ApplicationHelper
  # 引数で与えられたユーザのGravatar画像を返す
  def gravatar_for(user, size: 80, fullwidth: true)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    if fullwidth
      image_tag(gravatar_url, alt: user.username, class: 'gravatar rounded', width: '100%')
    else
      image_tag(gravatar_url, alt: user.username, class: 'gravatar rounded')
    end
  end
end
