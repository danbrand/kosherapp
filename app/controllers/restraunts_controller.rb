class RestrauntsController < ApplicationController
  before_action :set_restraunt, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_city

  # GET /restraunts
  def index
    @restraunts = Restraunt.all
  end

  # GET /restraunts/1
  def show
  end

  # GET /restraunts/new
  def new
    @restraunt = Restraunt.new
  end

  # GET /restraunts/1/edit
  def edit
  end

  # POST /restraunts
  def create
    @restraunt = Restraunt.new(restraunt_params)
    @restraunt.user = current_user
    @restraunt.city_id = @city.id

    if @restraunt.save
      redirect_to @city, notice: 'Restraunt was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /restraunts/1
  def update
    if @restraunt.update(restraunt_params)
      redirect_to @city, notice: 'Restraunt was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /restraunts/1
  def destroy
    @restraunt.destroy
    redirect_to restraunts_url, notice: 'Restraunt was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:city_id])
    end

    def set_restraunt
      @restraunt = Restraunt.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def restraunt_params
      params.require(:restraunt).permit(:name, :about, :restraunt_image, :user_id)
    end
end
