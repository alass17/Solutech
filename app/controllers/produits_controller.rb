class ProduitsController < ApplicationController
  before_action :set_produit, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:show , :index]
  # GET /produits or /produits.json
  def index
    @produits = Produit.all

    @q = Produit.ransack(params[:q])
    @produits = @q.result(distinct: true)
  end

  # GET /produits/1 or /produits/1.json
  def show
  end

  # GET /produits/new
  def new
    @produit = Produit.new
  end

  # GET /produits/1/edit
  def edit
  end

  # POST /produits or /produits.json
  def create
    @produit = Produit.new(produit_params)
   
    respond_to do |format|
      if @produit.save
        format.html { redirect_to produit_url(@produit), notice: "Produit creé avec succes." }
        format.json { render :show, status: :created, location: @produit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @produit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produits/1 or /produits/1.json
  def update
    respond_to do |format|
      if @produit.update(produit_params)
        format.html { redirect_to produit_url(@produit), notice: "Produit modifié avec succes." }
        format.json { render :show, status: :ok, location: @produit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @produit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produits/1 or /produits/1.json
  def destroy
    @produit.destroy

    respond_to do |format|
      format.html { redirect_to produits_url, notice: "Produit supprimé avec succes." }
      format.json { head :no_content }
    end
  end

# Pour afficher les produits d'une categorie
# def products_by_category
#   @category = Categorie.find(params[:category_id])
#   @produitss = @category.produits
# end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produit
      @produit = Produit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def produit_params
      params.require(:produit).permit( :nom, :description, :prix, :stock, :categorie_id, :image)
    end
end
