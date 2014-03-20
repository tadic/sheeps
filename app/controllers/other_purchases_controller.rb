class OtherPurchasesController < ApplicationController
  before_action :set_other_purchase, only: [:show, :edit, :update, :destroy]
  before_action :check_current_user, only: [:new, :edit, :destroy, :index, :show]
  # GET /other_purchases
  # GET /other_purchases.json
  def index
      @o_purchases = OtherPurchase.all.sort_by{|a| a.activity.date}
  end

  # GET /other_purchases/1
  # GET /other_purchases/1.json
  def show
  end

  # GET /other_purchases/new
  def new
    @other_purchase = OtherPurchase.new
  end

  # GET /other_purchases/1/edit
  def edit
  end

  # POST /other_purchases
  # POST /other_purchases.json
  def create
    @other_purchase = OtherPurchase.new(other_purchase_params)
    a = Activity.new date: convert_date_to_i(params[:dnabavka_date]), a_type: 'ostale_nabavke', comment:params[:dnabavka_comment], total_costs:params[:dnabavka_total_costs], location:params[:dnabavka_location]

    a.other_purchase = @other_purchase
    respond_to do |format|
      if a.save
        format.html { redirect_to @other_purchase, notice: 'Other purchase was successfully created.' }
        format.json { render action: 'show', status: :created, location: @other_purchase }
      else
        format.html { render action: 'new' }
        format.json { render json: @other_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /other_purchases/1
  # PATCH/PUT /other_purchases/1.json
  def update
    @other_purchase.what = params[:other_purchase][:what]
    @other_purchase.why = params[:other_purchase][:why]
    respond_to do |format|
      if @other_purchase.save
        @other_purchase.activity.update date:convert_date_to_i(params[:dnabavka_date]), location:params[:dnabavka_location], total_costs:params[:dnabavka_total_costs], comment:params[:dnabavka_comment]
        format.html { redirect_to @other_purchase, notice: 'Other purchase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @other_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /other_purchases/1
  # DELETE /other_purchases/1.json
  def destroy
    @other_purchase.destroy
    respond_to do |format|
      format.html { redirect_to other_purchases_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other_purchase
      @other_purchase = OtherPurchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def other_purchase_params
      params.require(:other_purchase).permit(:what, :why)
    end
end
