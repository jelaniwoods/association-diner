class LevelsController < ApplicationController
  before_action :set_level, only: %i[show edit store update destroy]

  # GET /levels
  def index
    @levels = Level.all
  end

  # GET /levels/1
  def show
    @selections = @level.selections
    @query = Query.new
  end

  def results
    @query = cookies[:query]
  end

  def store
    @query = params.fetch(:query)
    cookies[:query] = @query
    redirect_to "/levels/#{@level.id}/results", notice: "yup"
  end
  # GET /levels/new
  def new
    @level = Level.new
  end

  # GET /levels/1/edit
  def edit; end

  # POST /levels
  def create
    @level = Level.new(level_params)

    if @level.save
      redirect_to @level, notice: "Level was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /levels/1
  def update
    if @level.update(level_params)
      redirect_to @level, notice: "Level was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /levels/1
  def destroy
    @level.destroy
    redirect_to levels_url, notice: "Level was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_level
    if params[:id].nil?
      @level = Level.find(1) # TODO change to cookie thing maybe
    else
      @level = Level.find(params[:id])
    end
  end

  # Only allow a trusted parameter "white list" through.
  def level_params
    params.require(:level).permit(:number)
  end
end
