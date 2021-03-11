class Api::V1::LevelsController < ApplicationController
  before_action :set_user, only: [:avatar, :show, :update, :destroy]
  skip_before_action :authenticate_request

  def index
    @levels = levels.all
    
    render json: @levels
  end

  def new
    @level = level.new
  end

  def create
    @level = Level.new(level_params)
        if @level.save
          render json: success_json(@level), status: :created
        else
          render json: error_json(@level), status: :unprocessable_entity
        end
  end
   
  def edit
  end

  def update
      if @level.update(level_params)
        render json: @level
      else
        ender json: @level.errors, status: :unprocessable_entity
  end
  end

  def destroy
    @level.destroy
 end

  private

  def level_params
    params.require(:level).permit(:users_id, :semestre)
  end

  def success_json(level)
    {
      level: {
        id: level.id,
        user: level.users_id,
        semestre: level.semestre
      }
    }
  end
          
  def error_json(level)
    { errors: level.errors.full_messages }
  end

end
