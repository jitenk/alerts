class AlertsController < ApplicationController
  before_action :set_alert, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!

  # GET /alerts
  # GET /alerts.json
  def index
    @alerts = Alert.all
  end

  # GET /alerts/1
  # GET /alerts/1.json
  def show
  end

  # GET /alerts/new
  def new
    @alert = Alert.new
    @victims = @alert.victims.build
    @victims.images.build
    @alert.suspects.build
    @alert.vehicles.build

  end

  # GET /alerts/1/edit
  def edit
  end

  # POST /alerts
  # POST /alerts.json
  def create
    @alert = Alert.new(alert_params)

    respond_to do |format|
      if @alert.save
        format.html { redirect_to alerts_path, notice: 'Alert was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @alert }
      else
        format.html { render action: 'new' }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alerts/1
  # PATCH/PUT /alerts/1.json
  def update
    respond_to do |format|
      if @alert.update(alert_params)
        format.html { redirect_to @alert, notice: 'Alert was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @alert }
      else
        format.html { render action: 'edit' }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alerts/1
  # DELETE /alerts/1.json
  def destroy
    @alert.destroy
    respond_to do |format|
      format.html { redirect_to alerts_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert
      @alert = Alert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alert_params
      params.require(:alert).permit(:id, :name, :created_at, :updated_at, :date_requested, :last_seen, :last_known_address, :last_known_city, :last_known_state, :last_known_zip, :last_known_county, :site_of_incident, :nic, :agency_name, :agency_phone, :reporting_agency_phone, :reporting_agency_email, :investigating_officer_name, :investigating_officer_title, :investigating_officer_phone,
                                    victims_attributes: [:id, :last_name, :first_name, :birth_date, :gender, :hair_color, :height_ft, :height_inch, :weight, :eye_color, :race, :type, :age, :age_unit, :additional_info, :alert_id, :_destroy, images_attributes: [:id, :person_id, :avatar, :primary]],
                                    suspects_attributes: [:id, :last_name, :first_name, :birth_date, :gender, :hair_color, :height_ft, :height_inch, :weight, :eye_color, :race, :type, :age, :age_unit, :additional_info, :alert_id, :_destroy, images_attributes: [:id, :person_id, :avatar, :primary]],
                                    vehicles_attributes: [:id, :make, :model, :style, :year, :color, :license_plate_number, :license_plate_state, :additional_info, :alert_id, :_destroy])
    end
end
