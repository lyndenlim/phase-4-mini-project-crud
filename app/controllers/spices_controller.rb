class SpicesController < ApplicationController
  def index
    spices = Spice.all
    render json: spices
  end

  # def show
  #   if spice
  #     render json: spice
  #   else
  #     render json: { error: "spice not found" }, status: :not_found
  #   end
  # end

  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  def update
    if spice
      spice.update(spice_params)
      render json: spice
    else
      render json: { error: "spice not found" }, status: :not_found
    end
  end

  def destroy
    if spice
      spice.destroy
      head :no_content
    else
      render json: { error: "spice not found" }, status: :not_found
    end
  end

  private

  def spice
    Spice.find(params[:id])
  end

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end
end
