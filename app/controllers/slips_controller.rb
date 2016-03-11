class SlipsController < ApplicationController
  before_action :set_harbour
  before_action :set_pier
  before_action :set_slip, only: [:show, :edit, :update, :destroy]

  # GET /slips
  # GET /slips.json
  def index
    @slips = @pier.slips.all
  end

  # GET /slips/1
  def show
  end

  # GET /slips/new
  def new
    @slip = Slip.new
  end

  # GET /slips/1/edit
  def edit
  end

  # POST /slips
  # POST /slips.json
  def create
    @slip = Slip.new(slip_params)
      if @slip.save
         redirect_to pier_slips_path(@slip.pier), notice: 'Slip was successfully created.'
      else
        render :new
      end
    end

  # PATCH/PUT /slips/1
  # PATCH/PUT /slips/1.json
  def update
    respond_to do |format|
      if @slip.update(slip_params)
        format.html { redirect_to @slip, notice: 'Slip was successfully updated.' }
        format.json { render :show, status: :ok, location: @slip }
      else
        format.html { render :edit }
        format.json { render json: @slip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slips/1
  # DELETE /slips/1.json
  def destroy
    @slip.destroy
    respond_to do |format|
      format.html { redirect_to slips_url, notice: 'Slip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slip
      @slip = Slip.find(params[:id])
    end

    def set_pier
      @pier = Pier.find(params[:pier_id])
    end

    def set_harbour
      @harbour = Harbour.find(params[:harbour_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slip_params
      params.require(:slip).permit(:slip_number, :pier_id)
    end
end
