class LambingsController < ApplicationController
  before_action :set_lambing, only: [:update, :destroy]

  # GET /lambings
  # GET /lambings.json
  def index
    @lambings = Activity.all
    @sheeps = Sheep.all
  end

  # GET /lambings/1
  # GET /lambings/1.json
  def show
      @lambing = Activity.find(params[:id])
  end

  # GET /lambings/new
  def new
    @lambing = Lambing.new
    @sheeps = Sheep.all
  end
   def lambing_sheep_index_path
      lambing_path
  end

  # GET /lambings/1/edit
  def edit
      @lambing = Lambing.new
      @activity = Activity.find(params[:id])
      @sheeps = Sheep.all
  end

  # POST /lambings
  # POST /lambings.json
  def create
    lambings =  params[:lambings]
    activity = Activity.create date: convert_date_to_i(params[:date])
    

    lambings.each do |l|

      alive = (l[:alive] == 'true')
      if alive
        lamb = Sheep.create sex:l[:sex], mother_id:l[:sheep_id], status:'na farmi'
      else
        lamb = Sheep.create sex:l[:sex], mother_id:l[:sheep_id], status:'mrtvo rodjeno'
      end
      Lambing.create sheep_id:l[:sheep_id], activity_id: activity.id, lamb_id: lamb.id, is_alive: alive, comment: l[:comment], weight: l[:weight]
    end
    

    respond_to do |format|
      if true
        format.html { redirect_to lambings_path, notice: 'Lambing was successfully created.' }
        format.json { render action: 'index', status: :created, location: lambings_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @lambing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lambings/1
  # PATCH/PUT /lambings/1.json
  def update
    ppar = lambing_params
    lamb = Sheep.find_by id: @lambing.lamb_id
    if lamb.nil? 
      lamb = Sheep.create
    end
      
    sex = params.require(:post).permit(:sex)
    ppar = lambing_params

    lamb.update(mother_id: ppar[:sheep_id], sex: sex[:sex])
    respond_to do |format|
      if @lambing.update(lambing_params)
        format.html { redirect_to @lambing, notice: 'Lambing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lambing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lambings/1
  # DELETE /lambings/1.json
  def destroy
    @lambing.destroy
    respond_to do |format|
      format.html { redirect_to lambings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lambing
      @lambing = Lambing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lambing_params
      params.require(:lambing).permit(:date, :sheep_id, :comment, :sex)
    end
end
