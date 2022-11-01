# Controller class for the Teams model that will have functions to control all the behaviour of the Teams model.
class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]
  #Only allow signed in users to create, edit and destroy.
  before_action :authenticate_user!, except: [:index, :show]

  # GET /teams or /teams.json
  def index
    # Will be used as a reference variable to access the player model across the application.
    @teams = Team.all
  end

  # GET /teams/1 or /teams/1.json
  def show
  end

  # GET /teams/new
  def new

    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams or /teams.json
   # Used to control the creation of a team record in the database.
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: "Team was successfully created." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  # Used to control the updation of a team record in the database.
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: "Team was successfully updated." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
   # Used to control the deletion of a team record in the database.
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # Used to control the parameters that can be passed to the teams model
    def team_params
      params.require(:team).permit(:name, :mp, :won, :draw, :lose, :gf, :ga, :gd, :points)
    end
end
