class HousesController < ApplicationController

  #this will call find_house when the methods in the parameter are called
  before_action :find_house, only: [:show, :destroy, :update, :edit]

  #what ever variables are created in the controller, they can all be used in the view

  def index
    #consinder houses as a list or an array and use for loop to iterate through it
    if params[:category].blank?
      @houses = House.all.order("created_at DESC")
    else
      @category_id = Category.find_by_name(params[:category]).id
      @houses = House.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  def new
    @house = current_user.houses.build
    @categories = Category.all.map{|c| [c.name, c.id]}
  end

  def create
    @house = current_user.houses.build(house_params)
    @house.category_id = params[:category_id]

    if @house.save
      redirect_to root_path
    else
      render 'new'
    end
  end


  def show
  end

  def edit
    @categories = Category.all.map{|c| [c.name, c.id]}
  end

  def update
    @categories = Category.all.map{|c| [c.name, c.id]}

    if @house.update(house_params)
      redirect_to house_path(@house)
    else
      render edit
    end
  end

  def destroy
    @house.destroy
    redirect_to root_path

  end



  private
    def house_params
      #require a house to have these variable when created
      params.require(:house).permit(:address, :size, :room, :bathroom, :postal_code, :property_type, :price,
                                    :description, :category_id)
    end

    def find_house
      @house = House.find(params[:id])
    end


end
