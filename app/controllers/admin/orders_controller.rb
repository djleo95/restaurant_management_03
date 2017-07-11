class Admin::OrdersController < ApplicationController
  before_action :logged_in_admin
  before_action :check_for_cancel

  load_and_authorize_resource

  def index
    @orders_support = Supports::Order.new order: Order.all, param: params
    @tables = Table.all
  end

  def show
    @support = Supports::Order.new discount: params[:discount]
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new order_params
    if @order.save
      flash[:success] = t "flash.order.create_success"
      redirect_to admin_order_path @order
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update_attributes order_params
      flash[:success] = t "flash.order.update_success"
    else
      render :edit
    end
  end

  def destroy
    if @order.destroy
      flash[:success] = t "flash.order.delete_success"
    else
      flash[:danger] = t "flash.order.delete_fail"
    end
    respond_to do |format|
      format.html{redirect_to :back}
      format.json{head :no_content}
    end
  end

  private
  def order_params
    params.require(:order).permit :code, :discount, :day, :time_in, :is_confirm,
      guest_attributes: [:id, :name], table_attributes: [:id, :capacity]
  end

  def check_for_cancel
    redirect_to admin_orders_path if params[:commit] == %w(Cancel)
  end
end
