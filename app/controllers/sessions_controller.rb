class SessionsController < ApplicationController
  include CurrentUserConcern

  skip_before_action :verify_authenticity_token



  def create
    @user = User
              .find_by(email_address: params['email_address'])
              .try(:authenticate, params['password'])

    respond_to do |format|
      if @user
        session[:user_id] = @user.id
        format.html { redirect_to '/' }
        format.json { render :show, status: :created }
      else
        flash[:danger] = 'Invalid email/password combination'
        format.html { render :login, status: :unprocessable_entity }
        format.json { render status: :unprocessable_entity }
      end
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: {
      status: 200,
      logged_out: true
    }
    redirect_to '/'
  end
end

=begin
    if @user
      session[:user_id] = @user.id
      render json: {
        status: :created,
        logged_in: true,
        user: @user
      }
    else
      render json: {
        status: 401
      }
    end
=end