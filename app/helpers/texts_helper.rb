module TextsHelper

  def can_edit_text?(current_user,text)
    if (current_user && text.user && current_user.id == text.user.id)
      true
    else
      false
    end
  end


end
