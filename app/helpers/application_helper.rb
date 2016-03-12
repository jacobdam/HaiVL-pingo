module ApplicationHelper
  AVATAR_VERSIONS = {
    tiny: {
      :format => "png",
      :width => 20,
      :height => 20,
      :crop => :thumb,
    },
    thumb: {
      :format => "png",
      :width => 80,
      :height => 80,
      :crop => :thumb,
    }
  }

  def render_avatar(user, version)
    class_name = ['avatar', 'avatar-' + version.to_s]

    if user.avatar.full_public_id
      cl_image_tag(user.avatar.full_public_id, AVATAR_VERSIONS[version].merge(class: class_name))
    else
      image_tag 'no_avatar.svg', AVATAR_VERSIONS[version].slice(:width, :height).merge(class: class_name)
    end
  end
end
