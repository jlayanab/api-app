class UpdateUserService
    def initialize(user, params)
      @user = user
      @params = params
    end
  
    def call
      if @params[:avatar] && !file?(@params[:avatar])
        delete_image if @user.avatar.attached?
        @params.delete(:avatar)
      end
  
      @recipe.update(@params)
    end
  
    private
  
    def file?(param)
      param.is_a?(ActionDispatch::Http::UploadedFile)
    end
  
    def delete_image
      @user.avatar.purge
    end
end