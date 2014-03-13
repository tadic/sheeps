class SheepPurchasesController < ApplicationController


  # GET /sheep_purchases
  # GET /sheep_purchases.json
  def index
    @s_purchases = Activity.where(a_type: 'nabavka_ovaca').sort_by{|a| a[:date]}
  end

  # GET /sheep_purchases/1
  # GET /sheep_purchases/1.json
  def show
    @activity = Activity.find(params[:id])
  end

  # GET /sheep_purchases/new
  def new
    @sheep_purchase = SheepPurchase.new
  end

  # GET /sheep_purchases/1/edit
  def edit
      @sheep_purchase = SheepPurchase.new
      @activity = Activity.find(params[:id])
  end
  
  def desrtoy_activity(id)
      activity = Activity.find_by id: id
      if activity!=nil
        activity.destroy    #desrtoing edited activity and all lambing_childs
      end
  end
  
  def are_empty_params(purchases)
    if purchases==nil   
      @sheep_purchase = SheepPurchase.new
      respond_to do |format|
          format.html { render action: 'new', notice: 'Nista nije snimljeno posto nije ni uneto!' }
      end
      return true
    end
    return false
  end
  # POST /sheep_purchases
  # POST /sheep_purchases.json
  def create
  
    purchases = params[:purchases]
    return if are_empty_params(params[:purchases])
    @activity = Activity.find_by id: params[:activity_id].to_i
    if @activity!=nil
      update(@activity)
      return
    end
    @activity = Activity.new date: convert_date_to_i(params[:date]), comment: params[:comment], a_type: 'nabavka_ovaca', location: params[:location], total_costs:params[:total_costs]
    
    purchases.each do |p|
       add_purchase(p)
    end
     save_activity(@activity)
  end
  
  def add_purchase(p)
       @sheep = Sheep.new code:p[:sheep_code], sex:p[:sex], status:'na farmi', describe: p[:sheep_describe], percent_of_r: p[:percent_of_r], nickname:p[:nickname]
       @sheep_purchase= SheepPurchase.new   date_of_birth: convert_date_to_i(p[:date_of_birth]), comment: p[:purchase_comment], mother_code: p[:mother_code], father_code: p[:father_code], price: p[:price]
       @sheep_purchase.sheep = @sheep
       @activity.sheep_purchases.push(@sheep_purchase)
  end
  
  def save_activity(activity)
    respond_to do |format|
      if activity.save
        format.html { redirect_to '/sheep_purchases/'+ activity.id.to_s, notice: 'Nabavka ovaca je uspesno snimljena.' }
        format.json { render action: 'show', status: :created, location: @sheep_purchase }
      else
        format.html { render action: 'new' }
        format.json { render json: @sheep_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sheep_purchases/1
  # PATCH/PUT /sheep_purchases/1.json
  def update(activity)
    purchases = params[:purchases]
    activity.update date: convert_date_to_i(params[:date]), comment: params[:comment], a_type: 'nabavka_ovaca', location: params[:location], total_costs:params[:total_costs]
    
    activity.sheep_purchases.each do |sp|
      founded = false
      purchases.each do |p|
        if sp.id==p[:sheep_purchase_id].to_i    # if old purchase s not deleted - update
          founded = true
         # @sheep = Sheep.find_by id: sp.sheep.id
          sp.update date_of_birth: convert_date_to_i(p[:date_of_birth]), comment: p[:purchase_comment], mother_code: p[:mother_code], father_code: p[:father_code], price: p[:price]
          sp.sheep.update code:p[:sheep_code], sex:p[:sex], status:'na farmi', describe: p[:sheep_describe], percent_of_r: p[:percent_of_r], nickname:p[:nickname]
        end
      end
      if not founded
        sp.destroy
      end
    end

    purchases.each do |p|
      if p[:sheep_purchase_id]==nil               #  if is new - create
        add_purchase(p)
      end
    end
     save_activity(@activity)
  end

  # DELETE /sheep_purchases/1
  # DELETE /sheep_purchases/1.json
  def destroy
    @sheep_purchase = SheepPurchase.find(params[:id])
    @sheep_purchase.activity.destroy
    respond_to do |format|
      format.html { redirect_to sheep_purchases_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sheep_purchase
      @sheep_purchase = SheepPurchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sheep_purchase_params
      params.require(:sheep_purchase).permit(:price, :place, :activity_id, :sheep_id, :comment)
    end
end
