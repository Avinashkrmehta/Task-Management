class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request, only: :authenticate

  def authenticate
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = JsonWebTokenService.encode(user_id: user.id)
      render json: { auth_token: token }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end
end