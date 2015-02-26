module PostsHelper
  def post_is_editable?(author, logged_in_user)
    author == logged_in_user
  end

  def value_of_user_id(user)
    user.nil? ? nil : user.id
  end

  def image_for_current_user(user)
    return user.profile_photo.url if user.present? and user.profile_photo.url.present?
    'nouserimage.png'
  end

  def username_for_user(user)
    return 'Anonymous User' if user.nil?
    user.username
  end

  def map_image(latitude, longitude)
    return nil if latitude.nil? and longitude.nil?
    link_to raw("<span class='glyphicon glyphicon-globe'><span>"), "https://www.google.co.in/maps/place/#{latitude},#{longitude}", target: "_blank;"
  end

  def get_user_profile_picture(user)
    if user.nil?
      pic_url = 'nouserimage.png'
    elsif user.provider.present?
      pic_url = user.picture_url
    else
      pic_url = user.profile_photo.url
    end
    pic_url = 'nouserimage.png' if pic_url.nil?
    pic_url
  end
end
