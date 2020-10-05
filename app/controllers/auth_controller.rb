class AuthController < ApplicationController
  skip_before_action :verify_authenticity_token

  def login
    user = User
      .find_by(email: params["email"])
      .try(:authenticate, params["password"])

    if user
      session[:user_id] = user.id
      render "/dashboard"
    else
      render "auth/login"
    end
  end

  def register
    render "auth/register"
  end

  def create_account
    user = User.new(sign_up_params)

    if user.save
      render "/dashboard"
    else
      redirect_to "/login", flash: { error: "Unable to create account" }
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
