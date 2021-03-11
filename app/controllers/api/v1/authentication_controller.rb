class Api::V1::AuthenticationController < ApplicationController
    skip_before_action :authenticate_request
   
    def authenticate
      command = AuthenticateUser.call(params[:email], params[:password])
      @user = User.find_by_email(params[:email])
   
      if command.success?
        render json: { status: "ok", token: command.result, id: @user.id, Identification: @user.Identification, 
          avatar: @user.avatar.attached?, file: path_disk}
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    end

    private

    def path_disk
      if @user.avatar.attached?
        img = ActiveStorage::Blob.service.send(:path_for, @user.avatar.key)
      else
        img = nil
      end
    end
end