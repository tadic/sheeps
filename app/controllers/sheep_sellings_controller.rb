class SheepSellingsController < ApplicationController
  before_action :set_sheep_selling, only: [:show, :edit, :update, :destroy]
  before_action :check_current_user, only: [:new, :edit, :destroy, :index, :show]

  # GET /sheep_sellings
  # GET /sheep_sellings.json
  def index
    @sheep_sellings = SheepSelling.all
  end

  # GET /sheep_sellings/1
  # GET /sheep_sellings/1.json
  def show
  end

  # GET /sheep_sellings/new
  def new
    @sheep_selling = SheepSelling.new
  end

  # GET /sheep_sellings/1/edit
  def edit
  end

  # POST /sheep_sellings
  # POST /sheep_sellings.json
  def create
    @sheep_selling = SheepSelling.new(sheep_selling_params)

    respond_to do |format|
      if @sheep_selling.save
        format.html { redirect_to @sheep_selling, notice: 'Sheep selling was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sheep_selling }
      else
        format.html { render action: 'new' }
        format.json { render json: @sheep_selling.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sheep_sellings/1
  # PATCH/PUT /sheep_sellings/1.json
  def update
    respond_to do |format|
      if @sheep_selling.update(sheep_selling_params)
        format.html { redirect_to @sheep_selling, notice: 'Sheep selling was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sheep_selling.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sheep_sellings/1
  # DELETE /sheep_sellings/1.json
  def destroy
    @sheep_selling.destroy
    respond_to do |format|
      format.html { redirect_to sheep_sellings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sheep_selling
      @sheep_selling = SheepSelling.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sheep_selling_params
      params.require(:sheep_selling).permit(:activity_id, :sheep_id, :weight, :price, :place, :comment)
    end
end
