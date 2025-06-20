class StoresController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  

  def new
    if current_user.store.present?
      redirect_to current_user.store, alert: "Você já possui uma loja."
    else
      @store = Store.new
    end
  end

  def create
    @store = current_user.build_store(store_params)

    if @store.save
      redirect_to @store, notice: "Loja criada com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find_by!(slug: params[:slug])
  end

  private

  def store_params
    params.require(:store).permit(:nome, :slug, :slogan, :descricao)
  end
end
