class Api::V1::ImagesController < ApplicationController
    before_action :set_user, only: [:avatar, :show, :update, :destroy]
    skip_before_action :authenticate_request

    def index
      @images = Image.all
    
      render json: @images
    end

    def new
      @image = image.new
    end

    def create
      @image = Image.new(image_params)
          if @image.save
            render json: success_json(@image), status: :created
          else
            render json: error_json(@image), status: :unprocessable_entity
          end
    end
   
    def edit
    end

    def update
      if @image.update(image_params)
        render json: @image
      else
        render json: @image.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @image.destroy
    end

    private

    def image_params
      params.require(:image).permit(:users_id, :ruta, :status)
    end

    def success_json(image)
      {
        image: {
          id: image.id,
          user: image.users_id,
          ruta: image.ruta,
        }
      }
    end
          
    def error_json(image)
      { errors: image.errors.full_messages }
    end

end
