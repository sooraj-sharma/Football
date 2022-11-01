# Controller class for the Players model that will have functions to control all the behaviour of the Player model.
class PlayersController < ApplicationController
  before_action :set_player, only: %i[ show edit update destroy ]

  #Only allow signed in users to create, edit and destroy.
  before_action :authenticate_user!, except: [:index, :show]

  # GET /players or /players.json
  def index
    # Will be used as a reference variable to access the player model across the application.
    @players = Player.all
  end

  # GET /players/1 or /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players or /players.json
  # Used to control the creation of a player record in the database.
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: "Player was successfully created." }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1 or /players/1.json
  # Used to control the updation of a player record in the database.
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: "Player was successfully updated." }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1 or /players/1.json
  # Used to control the deletion of a player record in the database.
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: "Player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # Used to control the parameters that can be passed to the player model
    def player_params
      params.require(:player).permit(:name, :team, :postion, :matches, :goals)
    end
end
