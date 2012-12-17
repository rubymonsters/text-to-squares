class TextsController < ApplicationController
  include TextsHelper

  before_filter :set_text, :only => [:update, :edit, :destroy]
  before_filter :require_permision, :only=> [:update, :edit, :destroy]

  # GET /texts
  def index
    @texts = Text.order("created_at DESC").page(params[:page]).per(10)
    render :index      
  end

  # GET /texts/1
  def show
    @text = Text.find(params[:id])
    render :show
  end

  # GET /texts/new
  def new
    @text = Text.new
    render :new
  end

  # GET /texts/1/edit
  def edit
    render :edit
  end

  # POST /texts
  def create
    @text = Text.new(params[:text])
    @text.user = current_user

    if @text.save
      redirect_to @text, notice: 'Yeah, Square was successfully created.'
    else
      render action: "new" 
    end
  end

  # PUT /texts/1
  def update
    if @text.update_attributes(params[:text])
      redirect_to @text, notice: 'Square was successfully updated.'
    else
      render action: "edit" 
    end
  end

  # DELETE /texts/1
  def destroy
    @text = Text.find(params[:id])
    @text.destroy
    redirect_to texts_path
  end

  def require_permision
    unless can_edit_text?(current_user, @text)
      render :text => "No waffles for you", :status => 403
    end
  end

  def set_text
    @text = Text.find(params[:id])
  end
end
