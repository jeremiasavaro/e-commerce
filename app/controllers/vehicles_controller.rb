class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[ show edit update destroy ]

  def index
    @value_options = []
    if params[:filter_by].present?
      case params[:filter_by]
      when 'color'
        @value_options = Vehicle.distinct.pluck(:color).sort
      when 'year'
        @value_options = Vehicle.distinct.pluck(:year).sort.reverse
      when 'transmition'
        @value_options = ['Automática', 'Manual']
      end
    end
    @vehicles = Vehicle.all
    if params[:filter_by].present? && params[:filter_value].present?
      @vehicles = @vehicles.where("#{params[:filter_by]} = ?", params[:filter_value])
    end

    @pagy, @vehicles = pagy(@vehicles, items: 12)
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def new
    @vehicle = Vehicle.new
  end

  def edit
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: "Vehicle was successfully created." }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: "Vehicle was successfully updated." }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vehicle.destroy!

    respond_to do |format|
      format.html { redirect_to vehicles_path, status: :see_other, notice: "Vehicle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
      params.require(:vehicle).permit(:image , :name, :description, :price, :year, :color, :transmition)
    end
end
