module TextsHelper

  def helper_current_user_equals_text_user?(current_user,text)
    if (current_user && text.user && current_user.id == text.user.id)
      true
    else
      false
    end
  end


end
