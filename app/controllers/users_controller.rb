class UsersController < ApplicationController

  before_action :authorize_admin, only: [:index, :show, :edit, :update, :destroy]

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You've successfully signed up!"
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem signing up."
      redirect_to '/users/new'
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.all
    render :show
  end

  def update
    @user = User.find(params[:id])
    if user_params[:admin] == "1"
      if @user.admin = true
        @user.save
        flash[:notice] = "success"
        redirect_to user_path(@user)
      else
        flash[:notice] = "failure"
        render :edit
      end
    elsif user_params[:admin] == "0"
      if @user.admin = false
        flash[:notice] = "success"
        redirect_to user_path(@user)
      else
        flash[:notice] = "failure"
        render :edit
      end
    end
  end

  # Old update function. They both set the password hash to nil whenever I try and update things

  # def update
  #   @user = User.find(params[:id])
  #   admin_id = user_params[:admin]
  #   if admin_id =="1"
  #     if @user.update({"admin"=>true})
  #       flash[:notice] = "success"
  #       redirect_to user_path(@user)
  #     else
  #       flash[:notice] = "failure"
  #       render :edit
  #     end
  #   elsif admin_id == "0"
  #     if @user.update({"admin"=>false})
  #       flash[:notice] = "success"
  #       redirect_to user_path(@user)
  #     else
  #       flash[:notice] = "failure"
  #       render :edit
  #     end
  #   end
  # end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :admin)
  end
end
