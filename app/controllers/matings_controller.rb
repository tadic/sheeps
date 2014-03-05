class MatingsController < ApplicationController
  before_action :set_mating, only: [:show, :edit, :update, :destroy]

  # GET /matings
  # GET /matings.json
  def index
    @matings = Mating.all
  end

  # GET /matings/1
  # GET /matings/1.json
  def show
  end

  # GET /matings/new
  def new
    @mating = Mating.new
  end

  # GET /matings/1/edit
  def edit
  end

  # POST /matings
  # POST /matings.json
  def create
    @mating = Mating.new(mating_params)

    respond_to do |format|
      if @mating.save
        format.html { redirect_to @mating, notice: 'Mating was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mating }
      else
        format.html { render action: 'new' }
        format.json { render json: @mating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matings/1
  # PATCH/PUT /matings/1.json
  def update
    respond_to do |format|
      if @mating.update(mating_params)
        format.html { redirect_to @mating, notice: 'Mating was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matings/1
  # DELETE /matings/1.json
  def destroy
    @mating.destroy
    respond_to do |format|
      format.html { redirect_to matings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mating
      @mating = Mating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mating_params
      params.require(:mating).permit(:male_id, :price, :activity_id, :sheep_id, :comment)
    end
end
