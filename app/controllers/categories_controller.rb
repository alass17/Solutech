class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:show , :index]

  # GET /categories or /categories.json
  def index
    @categories = Categorie.all
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Categorie.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = Categorie.new(category_params)
    # @category.image = params[:category][:image].original_filename if params[:category] && params[:category][:image]
  
    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: "Categorie créée avec succès." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        # @category.image = params[:category][:image].original_filename if params[:category] && params[:category][:image]
  
        format.html { redirect_to category_url(@category), notice: "Categorie modifiée avec succès." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Categorie supprimée avec succes." }
      format.json { head :no_content }
    end
  end

  def products_by_category
    @category = Categorie.find(params[:id])
    @products = @category.produits
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Categorie.find(params[:id])
    end

   

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:categorie).permit(:nom, :description, :image)
    end
end
