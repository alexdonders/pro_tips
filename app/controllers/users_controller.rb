class UsersController < ApplicationController
  include RolesHelper
  include ApplicationHelper
  before_action :set_user,                  only: [:show, :edit, :update, :destroy]
  before_action :authorize_to_edit_user,    only: [:index, :edit, :update, :destroy]

  def index
    @users = User.all.page(params[:page])
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        @user.name = @user.email
        @user.avatar = default_avatar(@user)
        @user.save!
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        @user.avatar = default_avatar(@user) unless(@user.avatar_url.present?)
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :name, :avatar)
    end

    def edit_user_params
      params.require(:user).permit(:email, :name, :avatar, :role)
    end

    def authorize_to_edit_user
      redirect_to(account_path) unless(can_manage_users? || is_owner?(@user))
    end
end
