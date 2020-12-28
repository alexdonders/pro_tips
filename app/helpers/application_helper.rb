module ApplicationHelper
  require 'active_support/core_ext/string'
  USERNAME_LT_H = "https://68.media.tumblr.com/7d65a925636d6e3df94e2ebe30667c29/tumblr_nq1zg0MEn51qg6rkio1_500.jpg"
  USERNAME_LT_N = "https://68.media.tumblr.com/9f9b498bf798ef43dddeaa78cec7b027/tumblr_o51oavbMDx1ugpbmuo7_500.png"
  USERNAME_LT_U = "http://78.media.tumblr.com/75bad14fee104f69652084d545213291/tumblr_mldfty8fh41qcnibxo5_1280.png"
  USERNAME_ELSE = "https://68.media.tumblr.com/22d1c50c3e2ca1062a94b47a65bfeb6d/tumblr_o51oavbMDx1ugpbmuo10_500.png"
  USERNAME_NONE = "https://68.media.tumblr.com/7d65a925636d6e3df94e2ebe30667c29/tumblr_nq1zg0MEn51qg6rkio1_500.jpg"

  def default_avatar(user)

      return USERNAME_NONE unless user.name.present?

      letter = user.name[0].downcase

      case letter
      when letter < 'h'
        return USERNAME_LT_H
      when letter < 'n'
        return USERNAME_LT_N
      when letter < 'u'
        return USERNAME_LT_U
      else
        USERNAME_ELSE
      end

  end

  def pluralize_comments(comments)
    "#{comments.count} comment".pluralize(comments.count)
  end

  def pluralize_tips(tips)
    "#{tips.count} tips".pluralize(tips.count)
  end

end
