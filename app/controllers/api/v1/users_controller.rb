class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:avatar, :show, :update, :destroy]
    skip_before_action :authenticate_request
  
    def index
        @users = User.all

        render json: @users
    end

    # GET /users/1
    def show
        #render json: @user
        if @user.present?
            render json: success_json(@user), status: :ok
          else
            head :not_found
        end
    end

    # POST /users
    def create
        @user = User.new(user_params)
        if @user.save
          render json: success_json(@user), status: :created
        else
          render json: error_json(@user), status: :unprocessable_entity
        end
    end

    # PATCH/PUT /users/1
    def update
        if @user.update(user_params)
            render json: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    # DELETE /users/1
    def destroy
        @user.destroy
    end

    #Avatar
    def avatar
        user = User.find(params[:user_id])  
        if user&.avatar&.attached?
          redirect_to rails_blob_url(user.avatar)
        else
          head :not_found
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
        params.require(:user).permit(:email, :password, :avatar, :Identification, :Nombres, :Apellidos)
    end

    def success_json(user)
    {
        user: {
            id: user.id,
            email: user.email    
        }
    }
    end
        
    def error_json(user)
        { errors: user.errors.full_messages }
    end

    def show
        user = User.find_by(id: params[:id])
      
        if user.present?
          render json: success_json(user), status: :ok
        else
          head :not_found
        end
    end

end

