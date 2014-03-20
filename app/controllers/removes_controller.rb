class RemovesController < ApplicationController
  before_action :set_remove, only: [:show, :edit, :update, :destroy, :]

  # GET /removes
  # GET /removes.json
  def index
    @removes = Remove.all
  end

  # GET /removes/1
  # GET /removes/1.json
  def show
  end

  # GET /removes/new
  def new
    @remove = Remove.new
  end

  # GET /removes/1/edit
  def edit
  end

  # POST /removes
  # POST /removes.json
  def create
    @remove = Remove.new(remove_params)

    respond_to do |format|
      if @remove.save
        format.html { redirect_to @remove, notice: 'Remove was successfully created.' }
        format.json { render action: 'show', status: :created, location: @remove }
      else
        format.html { render action: 'new' }
        format.json { render json: @remove.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /removes/1
  # PATCH/PUT /removes/1.json
  def update
    respond_to do |format|
      if @remove.update(remove_params)
        format.html { redirect_to @remove, notice: 'Remove was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @remove.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /removes/1
  # DELETE /removes/1.json
  def destroy
    @remove.destroy
    respond_to do |format|
      format.html { redirect_to removes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remove
      @remove = Remove.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def remove_params
      params.require(:remove).permit(:death)
    end
end
