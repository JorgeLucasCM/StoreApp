class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_store
  before_action :set_product, only: [:edit, :update, :destroy,:buy,:show]

  def new
    @product = @store.products.new
  end

  def create
    @product = @store.products.new(product_params)
    if @product.save
      redirect_to store_path(@store), notice: "Produto criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    authorize_user!

    if @product.update(product_params)
      redirect_to store_path(@store), notice: "Produto atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def buy
    @product = @store.products.find(params[:id])
    flash[:notice] = "Você comprou #{@product.nome}!"
    redirect_to store_path(@store)
  end

  def destroy
    authorize_user!
    @product.destroy
    redirect_to store_path(@store), notice: "Produto removido com sucesso!"
  end

  def show
    @product = @store.products.find(params[:id] || params[:slug])
  end

  def set_store
    @store = Store.find_by!(slug: params[:store_slug] || params[:store_id])
  end

  def set_product
    @product = @store.products.find(params[:id] || params[:slug])
  end
  private

  def product_params
    params.require(:product).permit(:nome, :descricao, :preco, :variantes, :imagem)
  end

  def authorize_user!
    redirect_to root_path, alert: "Acesso não autorizado" unless current_user == @store.user
  end


end