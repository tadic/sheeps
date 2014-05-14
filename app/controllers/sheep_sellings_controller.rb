class SheepSellingsController < ApplicationController
  before_action :check_current_user, only: [:new, :edit, :destroy, :index, :show]

  # GET /sheep_sellings
  # GET /sheep_sellings.json
  def index
    @s_sellings =  Activity.where(a_type: 'prodaja').sort_by{|a| a[:date]}
  end

  # GET /sheep_sellings/1
  # GET /sheep_sellings/1.json
  def show
        @activity = Activity.find(params[:id])
  end

  # GET /sheep_sellings/new
  def new
    @sheep_selling = SheepSelling.new
    @sheeps = Sheep.on_farm
  end

  # GET /sheep_sellings/1/edit
  def edit
    @sheeps = Sheep.all
        @sheep_selling = SheepSelling.new
    @activity = Activity.find(params[:id])
  end
  
  def params_are_empty(sheeps)
    if sheeps==nil   
      @sheep_selling = SheepSelling.new
      @sheeps = Sheep.on_farm
      respond_to do |format|
          format.html { render action: 'new', notice: 'Nista nije snimljeno posto nije ni uneto!' }
      end
      return true
    end
    return false
  end
  


def create_activity_from_params
  sheeps = params[:sheep_selling]
  return if params_are_empty(sheeps)
    
    @activity = Activity.new date: convert_date_to_i(params[:date]), comment: params[:comment], total_costs:params[:total_costs], location: 'farma', a_type:'prodaja'
    
    sheeps.each do |p|
       @sheep_selling = SheepSelling.new sheep_id: p[:sheep_id], weight:p[:weight], price: p[:price], comment: p[:comment]
       @sheep_selling.sheep.update(status: 'prodato')
       @activity.sheep_sellings.push(@sheep_selling)
    end
  return @activity
end

  # POST /sheep_sellings
  # POST /sheep_sellings.json
  def create
    @activity = create_activity_from_params
    
    respond_to do |format|
      if @activity.save
        format.html { redirect_to '/sheep_sellings/'+ @activity.id.to_s, notice: 'Prodaja je uspesno uneta!' }
        format.json { render action: 'show', status: :created, location: @vacination }
      else
        format.html { render action: 'new' }
        format.json { render json: @sheep_selling.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sheep_sellings/1
  # PATCH/PUT /sheep_sellings/1.json
  def update
    destroy_activity(Activity.find(params[:id]))
    @activity = create_activity_from_params
    respond_to do |format|
      if @activity.save
        format.html { redirect_to '/sheep_sellings/'+ @activity.id.to_s, notice: 'Prodaja je uspesno azurirana.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sheep_selling.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sheep_sellings/1
  # DELETE /sheep_sellings/1.json
  def destroy_activity(a)
    if a.a_type == 'prodaja'
      a.sheep_sellings.each do |sel|
        sel.sheep.update status:'na farmi'
      end
      a.destroy
    end
  end
  
  def destroy
    ss = SheepSelling.find(params[:id])
    destroy_activity(Activity.find(ss.activity_id))
    
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
