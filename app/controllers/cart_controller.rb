class CartController < ApplicationController
  def show
   
  end

  def add
    @produit = Produit.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(produit_id: @produit.id)
    if current_orderable && quantity > 0
      current_orderable.update(quantity: quantity) # Utilisez simplement "quantity" ici
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orderables.create(produit: @produit, quantity: quantity) # Utilisez simplement "quantity" ici
    end
  
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
                                                   partial: 'cart/cart',
                                                   locals: { cart: @cart }),
                              turbo_stream.replace(@produit)]
      end
    end
  end
  

  def remove
    Orderable.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'cart/cart',
                                                  locals: { cart: @cart })
      end
    end
  end
end