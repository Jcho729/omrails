class TripsController < ApplicationController

  # GET /trips
  def index
    @trips = Trip.all
  end

  # GET /trips/1
  def show
    @trip = Trip.find(params[:id])
  end

  # GET /trips/new
  def new
    @trip = current_user.trips.new
  end

  # GET /trips/1/edit
  def edit
    @trip = current_user.trips.find(params[:id])
  end

  # POST /trips
  def create
    @trip = current_user.trips.new(trip_params)
      if @trip.save
        redirect_to @trip, notice: 'Trip was successfully created.'
      else
        render :new
      end
    end
  end

  # PATCH/PUT /trips/1
  def update
    @trip = current_user.trips.find(params[:id])
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  def destroy
    @trip = current_user.trips.find(params[:id])
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:city, :activity, :description)
    end
