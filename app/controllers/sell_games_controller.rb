class SellGamesController < ApplicationController
  load_and_authorize_resource
  before_action :set_sell_game, only: [:show, :edit, :update, :destroy]

  # GET /sell_games
  # GET /sell_games.json
  def _index
    @sell_games = SellGame.all
  end

  def search 
    @sell_games = SellGame.where("title LIKE ?", "%" + params[:q] + "%")
  end

  def mygames
    @sell_games = current_user.sell_games.all  
  end

  # GET /sell_games/1
  # GET /sell_games/1.json
  def show
    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
            name: @sell_game.title,
            description: @sell_game.description,
            amount: (@sell_game.price.to_i) * 100,
            currency: 'aud',
            quantity: 1,
        }],
        payment_intent_data: {
            metadata: {
                event_id: @sell_game.id
            }
        },
        success_url: "#{root_url}payments/success?sell_gametId=#{@sell_game.id}",
        cancel_url: "#{root_url}sell_games"
    )
    @session_id = session.id
  end

  # GET /sell_games/new
  def new
    @sell_game = SellGame.new
  end

  # GET /sell_games/1/edit
  def edit
  end

  # POST /sell_games
  # POST /sell_games.json
  def create
    @sell_game = SellGame.new(sell_game_params)
    @sell_game.user_id = current_user.id
    respond_to do |format|
      if @sell_game.save
        format.html { redirect_to @sell_game, notice: 'Sell game was successfully created.' }
        format.json { render :show, status: :created, location: @sell_game }
      else
        format.html { render :new }
        format.json { render json: @sell_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sell_games/1
  # PATCH/PUT /sell_games/1.json
  def update
    respond_to do |format|
      if @sell_game.update(sell_game_params)
        format.html { redirect_to @sell_game, notice: 'Sell game was successfully updated.' }
        format.json { render :show, status: :ok, location: @sell_game }
      else
        format.html { render :edit }
        format.json { render json: @sell_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sell_games/1
  # DELETE /sell_games/1.json
  def destroy
    @sell_game.destroy
    respond_to do |format|
      format.html { redirect_to sell_games_url, notice: 'Sell game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sell_game
      @sell_game = SellGame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sell_game_params
      params.fetch(:sell_game, :picture)
      params.require(:sell_game).permit(:title, :price, :description, :user_id, :picture)
    end
end
