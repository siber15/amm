class DevicesController < ApplicationController
  before_action :set_slip
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  # GET /devices
  def index
    @devices = @slip.devices.all
  end

  # GET /devices/1
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  def create
    @device = Device.new(device_params)
      if @device.save
        redirect_to slip_devices_path(@device.slip), notice: 'Device was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    def set_slip
      @slip = Slip.find(params[:slip_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:slip_id, :active, :device_number, :mac_address, :last_seen, :install_date, :software_version, :hardware_version, :current_status, :killed_date)
    end
end
