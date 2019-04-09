class LevelItemsController < ApplicationController
  before_action :set_level_item, only: [:show, :edit, :update, :destroy]

  # GET /level_items
  def index
    @level_items = LevelItem.all
  end

  # GET /level_items/1
  def show
  end

  # GET /level_items/new
  def new
    @level_item = LevelItem.new
  end

  # GET /level_items/1/edit
  def edit
  end

  # POST /level_items
  def create
    @level_item = LevelItem.new(level_item_params)

    if @level_item.save
      redirect_to @level_item, notice: 'Level item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /level_items/1
  def update
    if @level_item.update(level_item_params)
      redirect_to @level_item, notice: 'Level item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /level_items/1
  def destroy
    @level_item.destroy
    redirect_to level_items_url, notice: 'Level item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level_item
      @level_item = LevelItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def level_item_params
      params.require(:level_item).permit(:item_id, :level_id)
    end
end
