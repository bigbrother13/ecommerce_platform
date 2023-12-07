class ProductsController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def index
    user = current_user || User.new

    @products = Product.all
  end

  def show
    # Действие для просмотра отдельного товара
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Товар успешно создан.'
    else
      render :new
    end
  end

  def edit
    # Действие для редактирования товара
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Товар успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Товар успешно удален.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :category)
      # Получаем имя категории из параметров
      category_name = params.require(:product).permit(:category)[:category]

      # Ищем или создаем объект Category с заданным именем
      category = Category.find_or_initialize_by(name: category_name)
    
      # Объединяем category с другими параметрами продукта
      params.require(:product).permit(:name, :description, :price).merge(category: category)
    
  end
end
