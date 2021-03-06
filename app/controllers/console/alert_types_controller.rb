class Console::AlertTypesController < Console::BaseController
  before_action :set_alert_type, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!

  # GET /alert_types
  # GET /alert_types.json
  def index
    @alert_types = AlertType.all
  end

  # GET /alert_types/1
  # GET /alert_types/1.json
  def show
  end

  # GET /alert_types/new
  def new
    @alert_type = AlertType.new
    @alert_type.questions.build

  end

  # GET /alert_types/1/edit
  def edit
  end

  # POST /alert_types
  # POST /alert_types.json
  def create
    @alert_type = AlertType.new(alert_type_params)

    respond_to do |format|
      if @alert_type.save
        format.html { redirect_to console_alert_type_url(@alert_type), notice: 'Alert type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @alert_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @alert_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alert_types/1
  # PATCH/PUT /alert_types/1.json
  def update
    respond_to do |format|
      if @alert_type.update(alert_type_params)
        format.html { redirect_to console_alert_types_url, notice: 'Alert type was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @alert_type }
      else
        format.html { render action: 'edit' }
        format.json { render json: @alert_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alert_types/1
  # DELETE /alert_types/1.json
  def destroy
    @alert_type.destroy
    respond_to do |format|
      format.html { redirect_to console_alert_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert_type
      @alert_type = AlertType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alert_type_params
      params.require(:alert_type).permit(:name, questions_attributes: [:id, :order, :detail, :alert_type_id, :_destroy])
    end
end
