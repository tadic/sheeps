class UginucesController < ApplicationController
  before_action :set_uginuce, only: [:show, :edit, :update, :destroy]
  before_action :check_current_user, only: [:new, :edit, :destroy, :index, :show]
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
    @uginuce = Uginuce.new(uginuce_params)
    @sheep = Sheep.find_by id: @uginuce.sheep_id
    @sheep.update status:'uginulo'
    a = Activity.new date: convert_date_to_i(params[:uginuce_date]), a_type: 'uginuce', comment:params[:uginuce_comment], location: 'farma'

    a.uginuce = @uginuce
    respond_to do |format|
      if a.save
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
    if @uginuce.sheep.id!= params[:uginuce][:sheep_id].to_i
        @old_sheep = Sheep.find_by id: @uginuce.sheep_id
        @old_sheep.update status:'na farmi'
        @new_sheep = Sheep.find_by id: params[:uginuce][:sheep_id]
        @new_sheep.update status:'uginulo'
    end
    
    @uginuce.activity.update date: convert_date_to_i(params[:uginuce_date]), comment:params[:uginuce_comment]
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
    @uginuce.sheep.update status:'na farmi'
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
      params.require(:uginuce).permit(:sheep_id)
    end
end
