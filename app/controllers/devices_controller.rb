class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  # Da du ikke har nestet devices under slips længere, kan du ikke direkte hente et slip på den her måde.
  # derfor kan du slette denne linje, og set_slip action i bunden af controlleren
  # vi laver på et senere tidspunkt en funktion til at connecte en device med et slip.
  #before_action :set_slip, only: [:index, :create, :new]

  # GET /devices
  def index
    @devices = Device.all
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
        redirect_to devices_path(@device), notice: 'Device was successfully created.'
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

  def kill
    @device = Device.find(params[:id])
    if @device.update_column(:killed_date, Time.zone.now)
      redirect_to :back, notice: "Device killed"
    else
      redirect_to :back, alert: "ERROR"
    end
  end

  def reborn
  @device = Device.find(params[:id])
    if @device.update_column(:killed_date, nil)
      redirect_to :back, notice: "Device reborned"
    else
      redirect_to :back, alert: "ERROR"
    end
  end

  def batch_add

    #check if values is put in then the param would not be "", if not then set default value
    start_number = params[:start_number] != "" ? params[:start_number].to_i : 1
    zeros = params[:zeros] != "" ? params[:zeros].to_i : 4
    count = params[:count] != "" ? params[:count].to_i : 1
    text = params[:text] != "" ? params[:text] : "Device"

    devices = []

    #runs x times - defined by count-input or default 1
    count.to_i.times do |i|
      #set the number to add to the text by adding the i index to the start_number
      device_number = start_number + i

      #creates the name for the device
      # last_number.to_s.rjust(zeros, '0') adds leading zeros (0001, 0002.... 0010, 0011... 0100, 0101 and so on)
      name = "#{text}#{device_number.to_s.rjust(zeros, '0')}"

      #writes the name to the console, for debugging
      puts name

      devices << {device_number: name}

      #creates the device in the DB
      #Device.create(device_number: name, software_version: params[:software], hardware_version: params[:hardware])
    end

    #create all devices at once
    Device.create(devices) do |d|
      d.hardware_version = params[:hardware]
      d.software_version = params[:software]
    end

    #redirect the user back to devices path
    redirect_to devices_path, notice: "#{count} devices was created."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:slip_id, :active, :device_number, :mac_address, :last_seen, :install_date, :software_version, :hardware_version, :current_status, :killed_date)
    end
end
