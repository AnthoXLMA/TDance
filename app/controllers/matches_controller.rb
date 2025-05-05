class MatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @matches = current_user.matches.includes(:user1, :user2)
  end

  def show
    @match = Match.find(params[:id])
    unless @match.involves?(current_user)
      redirect_to matches_path, alert: "Accès non autorisé"
      return
    end
    @messages = @match.messages.includes(:user).order(created_at: :asc)
    @message = Message.new
  end
end
