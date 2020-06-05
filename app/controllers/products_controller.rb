class ProductsController < ApplicationController
  before_action :authenticate_user!, :except => [:home]
  before_action :authorized_admin?, :only => [:new, :edit, :create, :destroy, :update]
  
  def index
    @products = Product.all.order("created_at DESC")
    @most_recent_products = Product.three_most_recent
    @most_reviews = Product.three_most_reviews
    render :index
  end

  def home
    render :home
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "New product added!"
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product updated!"
      redirect_to products_path
    else
      render :edit
    end
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product deleted!"
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end

end