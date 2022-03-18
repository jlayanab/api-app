class Api::V1::PassesController < ApplicationController
  before_action :set_pass, only: [:show, :update, :destroy]

  # GET /passes
  def index
    @passes = Pass.all
    render json: @passes
  end

  # GET /passes/1
  def show
    @pass = @user.passes
    #@pass = Pass.find(params[:id])
  end

  # GET /users/2
  def show
    #render json: @user
    if @pass.present?
        render json: success_json(@pass), status: :ok
      else
        head :not_found
    end
  end


  # POST /items
  def create
    #@user = User.find(params[:user_id])
    #@pass = @user.passes.create(pass_params)
    @pass = current_user.passes.new(pass_params)
    #@pass = Pass.new(pass_params)

    if @pass.save
      render json: success_json(@pass), status: :created
    else
      render json: error_json(@pass), status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @pass.update(pass_params)
      render json: @pass
    else
      render json: @pass.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @pass.destroy
    render json: {status: 'ok'}
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_pass
      @pass = Pass.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pass_params
      params.require(:pass).permit(:code, :datein, :deteout, :status)
    end

    def success_json(pass)
    {
      pass: {
        id: pass.id,
        name: pass.code
      }
    }
    end
          
    def error_json(pass)
      { errors: pass.errors.full_messages }
    end
end