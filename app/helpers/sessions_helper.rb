module SessionsHelper
  def user_is_admin?
    current_user.admin?
  end

  def current_user? user
    user == current_user
  end

  def check_admin
    unless current_user.admin?
      flash[:alert]= "user isn't admin!"
      redirect_to root_path
    end    
  end
end
