module TextsHelper
  def user_can_edit?(requesting_user, text)
    !!(requesting_user && text.user && requesting_user == text.user)
  end

  def helper_current_user_equals_text_user?(current_user,text)
    if (current_user && text.user && current_user.id == text.user.id)
      true
    else
      false
    end
  end


end
