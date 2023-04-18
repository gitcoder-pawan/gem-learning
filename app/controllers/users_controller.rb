class UsersController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]

    # get /users
    def index 
        @users = User.all 
        render json: @users, status: :ok
    end

    # post /users
    def create
        @user = User.new(user_params)

        if(@user.save)
            render json: @user, status: :created
        else 
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity 
        end
    end

    private 
        def user_params
            params.permit(:name, :username, :email, :password )
        end
end
