module TextsHelper

  def can_edit_text?(user,text)
    if user_owns_text?(user,text) || user && user.admin?
      true
    else
      false
    end
  end

  def user_owns_text?(user,text) 
    user && text.user && user.id == text.user.id
  end
end
