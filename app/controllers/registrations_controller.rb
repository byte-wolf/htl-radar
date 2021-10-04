class RegistrationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    @user = User.create!(
      email_address: params['email_address'],
      user_name: params['user_name'],
      password: params['password'],
      password_confirmation: params['password_confirmation']
    )

    if @user
      render json: {
        status: :created,
        user: @user
      }
    else
      render json: {
        status: 422
      }
    end
  end
end
