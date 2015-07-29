class PoptartsController < ApplicationController
  respond_to :json

  def index
    respond_with Poptart.all
  end
end
