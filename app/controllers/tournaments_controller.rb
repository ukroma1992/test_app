class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:register_team, :withdraw_team]
  before_action :set_team,       only: [:register_team, :withdraw_team]
  before_action :check_user,     only: [:register_team, :withdraw_team]

  def index
    @tournaments = Tournament.all
  end

  def register_team
    @tournament.teams << @team

    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: 'Команда была успешно зарегистрирована.' }
      format.js { render :replace_tournament }
    end
  end

  def withdraw_team
    @tournament.teams.destroy(@team)

    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: 'Команда была успешно отменена.' }
      format.js { render :replace_tournament }
    end
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end

  def set_team
    @team = Team.find(params[:team_id])
  end

  def check_user
    unless current_user_have_team?(@team)
      redirect_to tournaments_path, notice: 'У вас нет доступа к этой области!'
    end
  end

  def tournament_params
    params.fetch(:tournament, {})
  end
end
