class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :set_type

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: "#{type} was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: "#{type} was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end

  private

  def set_type
    @type = type
  end

  def type
    params[:type] || "person"
  end

  def type_class
    type.constantize
  end

  def set_person
    @person = type_class.find(params[:id])
  end

  def person_params
    params.require(type.underscore.to_sym).permit(:id, :last_name, :first_name, :birth_date, :gender, :hair_color, :height_ft, :height_inch, :weight, :eye_color, :race, :type, :age, :age_unit, :additional_info, :alert_id)
  end
end