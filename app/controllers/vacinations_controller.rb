class VacinationsController < ApplicationController
  before_action :set_vacination, only: [:show, :edit, :update, :destroy]

  # GET /vacinations
  # GET /vacinations.json
  def index
    @vacinations = Vacination.all
  end

  # GET /vacinations/1
  # GET /vacinations/1.json
  def show
  end

  # GET /vacinations/new
  def new
    @vacination = Vacination.new
  end

  # GET /vacinations/1/edit
  def edit
  end

  # POST /vacinations
  # POST /vacinations.json
  def create
    @vacination = Vacination.new(vacination_params)

    respond_to do |format|
      if @vacination.save
        format.html { redirect_to @vacination, notice: 'Vacination was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vacination }
      else
        format.html { render action: 'new' }
        format.json { render json: @vacination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacinations/1
  # PATCH/PUT /vacinations/1.json
  def update
    respond_to do |format|
      if @vacination.update(vacination_params)
        format.html { redirect_to @vacination, notice: 'Vacination was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vacination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacinations/1
  # DELETE /vacinations/1.json
  def destroy
    @vacination.destroy
    respond_to do |format|
      format.html { redirect_to vacinations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacination
      @vacination = Vacination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vacination_params
      params.require(:vacination).permit(:reason, :vaccin_name, :activity_id, :sheep_id, :comment)
    end
end
