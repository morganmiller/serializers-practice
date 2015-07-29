class PoptartsController < ApplicationController
  respond_to :json

  def index
    respond_with Poptart.all
  end

  def show
    poptart = Poptart.find_by(id: params[:id])
    if params[:promotion] == 'halloween'
      render json: poptart, serializer: HalloweenPoptartSerializer
    else
      respond_with poptart
    end
  end

  def create
    poptart = Poptart.create(poptart_params)
    respond_with poptart
  end

  def update
    poptart = Poptart.find_by(id: params[:id])
    poptart.update!(poptart_params)
    respond_with poptart
  end

  def destroy
    poptart = Poptart.find_by(id: params[:id])
    poptart.destroy
    respond_with poptart
  end

private

  def poptart_params
    params.require(:poptart).permit(:flavor, :sprinkles)
  end
end
