class RelationpollsController < ApplicationController
  before_action :set_relationpoll, only: [:show, :edit, :update, :destroy]

  # GET /relationpolls
  # GET /relationpolls.json
  def index
    @relationpolls = Relationpoll.all
  end

  # GET /relationpolls/1
  # GET /relationpolls/1.json
  def show
  end

  # GET /relationpolls/new
  def new
    @relationpoll = Relationpoll.new
  end

  # GET /relationpolls/1/edit
  def edit
  end

  # POST /relationpolls
  # POST /relationpolls.json
  def create
    @relationpoll = Relationpoll.new(relationpoll_params)

    respond_to do |format|
      if @relationpoll.save
        format.html { redirect_to @relationpoll, notice: 'Relationpoll was successfully created.' }
        format.json { render :show, status: :created, location: @relationpoll }
      else
        format.html { render :new }
        format.json { render json: @relationpoll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relationpolls/1
  # PATCH/PUT /relationpolls/1.json
  def update
    respond_to do |format|
      if @relationpoll.update(relationpoll_params)
        format.html { redirect_to @relationpoll, notice: 'Relationpoll was successfully updated.' }
        format.json { render :show, status: :ok, location: @relationpoll }
      else
        format.html { render :edit }
        format.json { render json: @relationpoll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relationpolls/1
  # DELETE /relationpolls/1.json
  def destroy
    @relationpoll.destroy
    respond_to do |format|
      format.html { redirect_to relationpolls_url, notice: 'Relationpoll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relationpoll
      @relationpoll = Relationpoll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relationpoll_params
      params.require(:relationpoll).permit(:user, :donator)
    end
end
