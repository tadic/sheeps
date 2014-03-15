class MortalitiesController < ApplicationController
  before_action :set_mortality, only: [:show, :edit, :update, :destroy]

  # GET /mortalities
  # GET /mortalities.json
  def index
    @mortalities = Mortality.all
    @sheeps = Sheep.all
  end

  # GET /mortalities/1
  # GET /mortalities/1.json
  def show
  end

  # GET /mortalities/new
  def new
    @mortality = Mortality.new
    @sheeps = Sheep.all
  end

  # GET /mortalities/1/edit
  def edit
    @sheeps = Sheep.all
  end

  # POST /mortalities
  # POST /mortalities.json
  def create
    @mortality = Mortality.new(mortality_params)
    @sheep = Sheep.find_by id: @mortality.sheep_id
    @sheep.update status:'uginulo'
    a = Activity.create date: convert_date_to_i(params[:mortality][:date]), a_type: 'uginuce'

    @mortality.activity = a
    respond_to do |format|
      if @mortality.save
 
        format.html { redirect_to mortalities_path, notice: 'Mortality was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mortality }
      else
        format.html { render action: 'new' }
        format.json { render json: @mortality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mortalities/1
  # PATCH/PUT /mortalities/1.json
  def update
    if @mortality.sheep.id!= params[:mortality][:sheep_id].to_i
        @old_sheep = Sheep.find_by id: @mortality.sheep_id
        @old_sheep.update status:'na farmi'
        @new_sheep = Sheep.find_by id: params[:mortality][:sheep_id]
        @new_sheep.update status:'uginulo'
    end
    
    @mortality.activity.update date: convert_date_to_i(params[:mortality][:date])
    respond_to do |format|
      if @mortality.update(mortality_params)
        format.html { redirect_to mortalities_path, notice: 'Mortality was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mortality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mortalities/1
  # DELETE /mortalities/1.json
  def destroy
    @mortality.sheep.update status:'na farmi'
    @mortality.destroy
    respond_to do |format|
      format.html { redirect_to mortalities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mortality
      @mortality = Mortality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mortality_params
      params.require(:mortality).permit(:sheep_id, :describe)
    end
end
