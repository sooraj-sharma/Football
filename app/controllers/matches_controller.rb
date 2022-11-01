
# Controller class for the Match model that will have functions to control all the behaviour of the Match model.
class MatchesController < ApplicationController
 
  before_action :set_match, only: %i[ show edit update destroy ]

  #Only allow signed in users to create, edit and destroy.
  before_action :authenticate_user!, except: [:index, :show]

  # GET /matches or /matches.json
  def index
     # Will be used as a reference variable to access the match model across the application. 
    @matches = Match.all
  end

  # GET /matches/1 or /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches or /matches.json
  # Used to control the creation of a match record in the database.
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: "Match was successfully created." }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1 or /matches/1.json
  # Used to control the updation of a match record in the database.
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: "Match was successfully updated." }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1 or /matches/1.json
  # Used to control the deletion of a match record in the database.
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: "Match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # Used to control the parameters that can be passed to the match model
    def match_params
      params.require(:match).permit(:home_team, :away_team, :match_date)
    end
end
