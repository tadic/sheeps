class SheepPurchasesController < ApplicationController
  before_action :set_sheep_purchase, only: [:show, :edit, :update, :destroy]

  # GET /sheep_purchases
  # GET /sheep_purchases.json
  def index
    @sheep_purchases = SheepPurchase.all
  end

  # GET /sheep_purchases/1
  # GET /sheep_purchases/1.json
  def show
  end

  # GET /sheep_purchases/new
  def new
    @sheep_purchase = SheepPurchase.new
  end

  # GET /sheep_purchases/1/edit
  def edit
  end

  # POST /sheep_purchases
  # POST /sheep_purchases.json
  def create
    @sheep_purchase = SheepPurchase.new(sheep_purchase_params)

    respond_to do |format|
      if @sheep_purchase.save
        format.html { redirect_to @sheep_purchase, notice: 'Sheep purchase was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sheep_purchase }
      else
        format.html { render action: 'new' }
        format.json { render json: @sheep_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sheep_purchases/1
  # PATCH/PUT /sheep_purchases/1.json
  def update
    respond_to do |format|
      if @sheep_purchase.update(sheep_purchase_params)
        format.html { redirect_to @sheep_purchase, notice: 'Sheep purchase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sheep_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sheep_purchases/1
  # DELETE /sheep_purchases/1.json
  def destroy
    @sheep_purchase.destroy
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
