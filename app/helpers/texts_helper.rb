module TextsHelper
  def user_can_edit?(requesting_user, text)
    !!(requesting_user && text.user && requesting_user == text.user)
  end

  def can_edit_text?(current_user,text)
    if (current_user && text.user && current_user.id == text.user.id)
      true
    else
      false
    end
  end


end
