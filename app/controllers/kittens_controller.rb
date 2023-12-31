class KittensController < ApplicationController
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render json: @kittens.to_json}
    end
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash.alert = "Kitten Created!"
      redirect_to @kitten
    else
      flash.alert = "Create Failed!"
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @kitten.to_json}
    end
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      flash.alert = "Kitten Updated!"
      redirect_to @kitten
    else
      flash.alert = "Updated Failed!"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash.alert = "Kitten Deleted!"
    redirect_to root_path, status: :see_other
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
