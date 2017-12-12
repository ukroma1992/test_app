class TeamsController < ApplicationController
  before_action :set_team, only: [:edit, :update, :destroy]


  def index
    @teams = @tournament ? Team.in_tournament(@tournament) : Team.all
  end

  def new
    @team = current_user.build_team
  end

  def edit
  end

  def create
    @team = current_user.build_team(team_params)
    if @team.save
      redirect_to teams_path, notice: 'Команда была успешно создана.'
    else
      render 'new'
    end
  end

  def update
    if @team.update(team_params)
      redirect_to teams_path, notice: 'Команда была успешно обновлена.'
    else
      render 'edit'
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_url, notice: 'Команда была успешно удалена.'
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def set_tournament
    @tournament = params[:tournament_id].present? ? Tournament.find(params[:tournament_id]) : nil
  end

  def check_user
    if !log_in? || creating_another_team? || editing_another_team?
      redirect_to root_path, notice: 'У вас нет доступа к этой области!'
    end
  end

  ##
  # User already has a team and creates new one.
  #
  def creating_another_team?
    %w(new create).include?(action_name) && current_user.have_team?
  end

  ##
  # User editing team which he does not own.
  #
  def editing_another_team?
    %w(edit update destroy).include?(action_name) && (current_user.team.try(:id) != params[:id].to_i)
  end

  def team_params
    params.require(:team).permit(:name, :user_id, :photo, :tournament_id)
  end

end
