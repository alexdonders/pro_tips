class AccountController < ApplicationController
  before_action :ensure_authenticated

  def edit
    user_id = current_user.id
    if(user_id.nil?)
      redirect_to(new_session_path, status: 403)
    else
      @user = User.find(user_id)
    end
  end

  def update
    redirect_to account_path
  end
end
