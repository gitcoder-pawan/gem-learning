class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request
    def login 
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            token = encode(user_id: @user.id)
            render json: { token: token}, status: :ok
        else
            render json: { error: 'unauthorized'}, status: :unauthorized
        end
    end
end

#temp JWT Token created at { 18-04-2023 5:00pm }
# eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE2ODI0MjMxMDd9.3P53N3OGTvDisTBVMB3UEyBgCsmt2B7GKqBlrwlCEu0