class TermsController < ApplicationController
  def index
    if params[:query].blank?
      @terms = Term.all
    else
      @terms = Term.find_by(:term => params[:query])
    end

    render json: @terms
  end

  def show
    @term = Term.find(params[:id])
  end

  def new
    @term = Term.new
  end

  def create
    @term = Term.new(secure_params)

    if @term.save
      redirect_to @term
    else
      render 'new'
    end
  end

  def edit
    @term = Term.find(params[:id])
  end

  def update
    @term = Term.find(params[:id])

    if @term.update(secure_params)
      redirect_to @term
    else
      render 'edit'
    end
  end

  def destroy
    @term = Term.find(params[:id])
    @term.destroy

    redirect_to root_path
  end

  private

  def secure_params
    params.require(:term).permit(:term, :description)
  end
end
