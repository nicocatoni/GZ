class GrowshopsController < ApplicationController
  before_action :set_growshop, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:edit, :update,  :create]

  # GET /growshops
  # GET /growshops.json
  def index
        
    @growshops = Growshop.near(
      current_user.address,
      100,
      units: :km
    )
    @hash = Gmaps4rails.build_markers(@growshops) do |grow, marker|
      marker.lat grow.latitude
      marker.lng grow.longitude
      marker.infowindow grow.name
      marker.picture({
        :url => "/hojasss.png",
        :width   => 36,
        :height  => 36
       })
       
    end

  end

  # GET /growshops/1
  # GET /growshops/1.json
  def show
    @growshop = Growshop.find(params[:id])
    
    
  end

  # GET /growshops/new
  def new
    @growshop = Growshop.new
  end

  # GET /growshops/1/edit
  def edit
  end


  def findaddress
    @address = Geocoder.address([params[:latitude], params[:longitude]])
  end

  # POST /growshops
  # POST /growshops.json
  def create
    @growshop = Growshop.new(growshop_params)
    @growshop.user = current_user

    respond_to do |format|
      if @growshop.save
        format.html { redirect_to @growshop, notice: 'Growshop was successfully created.' }
        format.json { render :show, status: :created, location: @growshop }
      else
        format.html { render :new }
        format.json { render json: @growshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /growshops/1
  # PATCH/PUT /growshops/1.json
  def update
    respond_to do |format|
      if @growshop.update(growshop_params)
        format.html { redirect_to @growshop, notice: 'Growshop was successfully updated.' }
        format.json { render :show, status: :ok, location: @growshop }
      else
        format.html { render :edit }
        format.json { render json: @growshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /growshops/1
  # DELETE /growshops/1.json
  def destroy
    @growshop.destroy
    respond_to do |format|
      format.html { redirect_to growshops_url, notice: 'Growshop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_growshop
      @growshop = Growshop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def growshop_params
      params.require(:growshop).permit(:name, :description, :address, :longitude, :latitude)
    end
end
