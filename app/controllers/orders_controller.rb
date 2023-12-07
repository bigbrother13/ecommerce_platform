class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  def index
    @orders = Order.all
  end

  def show
    # Дополнительные действия для отображения конкретного заказа
  end

  def new
    @order = Order.new
    # Дополнительные действия для создания нового заказа
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      OrderMailer.order_confirmation(@order).deliver_now

      OrderMailer.order_confirmation(@order).deliver_now
      redirect_to @order, notice: 'Заказ успешно создан.'
    else
      render :new
    end
  end

  def sample_email
    mail(to: 'gritskevich.vladimi@gmail.com', subject: 'Test Email') do |format|
      format.text { render plain: 'Hello, this is a test email!' }
    end
  end

  def edit
    # Дополнительные действия для редактирования заказа
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Заказ успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Заказ успешно удален.'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:customer_name, :email, :status)
  end
end
