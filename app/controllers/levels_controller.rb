class LevelsController < ApplicationController
  before_action :set_level, only: %i[show edit store results update destroy]

  # GET /levels
  def index
    @levels = Level.all
  end

  # GET /levels/1
  def show
    @selections = @level.selections
    @query = Query.new
    @selections.each do |selection|
      Selection.update(selection.id, selected: false)
    end

  end

  def results
    @selections = @level.selections
    @query = cookies[:query].gsub(/\s+/, "")
    @res = false
    @collection_returned = false
    # Selected One object
    # Selected Collection
    case @query
    when "Plate.where(id:2).first", "Plate.where(id:2)[0]",
      "Plate.where(:id=>2).first","Plate.where(:id=>2)[0]",
      "Plate.where({:id=>2})[0]", "Plate.where({:id=>2}).first",
      "Plate.find_by(id:2)", "Plate.find_by(:id=>2)", "Plate.find(2)",
      @res = true
      Selection.update(2, selected: true)

  when "Plate.where({:id=>2})", "Plate.where(id:2)", "Plate.where({:id=>2})",
    "Plate.where(id:2)", "Plate.where(:id=>2)"
      # TODO Select Collection
      # Selection.update(1, selected: true)
      # Selection.update(2, selected: true)
      # How to show that a Collection is returned an not a value
      @collection_returned = true
      @res = false
    else
      @res = false
    end
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

  def set_selected(selection)
    selection.update(selected: true)
  end
end
