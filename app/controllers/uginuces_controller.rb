class UginucesController < ApplicationController
  before_action :set_uginuce, only: [:show, :edit, :update, :destroy]

  # GET /uginuces
  # GET /uginuces.json
  def index
    @uginuces = Uginuce.all
    @sheeps = Sheep.all
  end

  # GET /uginuces/1
  # GET /uginuces/1.json
  def show
  end

  # GET /uginuces/new
  def new
    @uginuce = Uginuce.new
        @sheeps = Sheep.all
  end

  # GET /uginuces/1/edit
  def edit
        @sheeps = Sheep.all
  end

  # POST /uginuces
  # POST /uginuces.json
  def create
    @mortality = Mortality.new(mortality_params)
    @sheep = Sheep.find_by id: @mortality.sheep_id
    @sheep.update status:'uginulo'
    a = Activity.create date: convert_date_to_i(params[:mortality][:date]), a_type: 'uginuce'

    @mortality.activity = a
    respond_to do |format|
      if @uginuce.save
        format.html { redirect_to @uginuce, notice: 'Uginuce was successfully created.' }
        format.json { render action: 'show', status: :created, location: @uginuce }
      else
        format.html { render action: 'new' }
        format.json { render json: @uginuce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uginuces/1
  # PATCH/PUT /uginuces/1.json
  def update
    if @mortality.sheep.id!= params[:mortality][:sheep_id].to_i
        @old_sheep = Sheep.find_by id: @mortality.sheep_id
        @old_sheep.update status:'na farmi'
        @new_sheep = Sheep.find_by id: params[:mortality][:sheep_id]
        @new_sheep.update status:'uginulo'
    end
    
    @mortality.activity.update date: convert_date_to_i(params[:mortality][:date])
    respond_to do |format|
      if @uginuce.update(uginuce_params)
        format.html { redirect_to @uginuce, notice: 'Uginuce was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @uginuce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uginuces/1
  # DELETE /uginuces/1.json
  def destroy
    @uginuce.destroy
    respond_to do |format|
      format.html { redirect_to uginuces_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uginuce
      @uginuce = Uginuce.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uginuce_params
      params.require(:uginuce).permit(:sheep_id, :activity_id)
    end
end
