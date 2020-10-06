class AuthController < ApplicationController
  include SessionHelper
  skip_before_action :verify_authenticity_token

  def login
    user = User
      .find_by(email: params["email"])
      .try(:authenticate, params["password"])

    if user
      session[:user_id] = user.id
      redirect_to "/"
    else
      render "auth/login", flash: { error: "invalid email/password" }
    end
  end

  def register
    render "auth/register"
  end

  def create_account
    @user = User.new(sign_up_params)

    if @user.save
      render "/dashboard"
    else
      redirect_to "/login", flash: { error: @user.errors.messages }
    end
  end

  def logout
    reset_session
  end

  protected

  def sign_up_params
    params.permit(:firstName, :lastName, :email, :password, :password_confirmation)
  end
end
