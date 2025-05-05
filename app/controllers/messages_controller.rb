class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @match = Match.find(params[:match_id])
    return redirect_to matches_path, alert: "Accès refusé" unless @match.involves?(current_user)

    @message = @match.messages.build(message_params)
    @message.user = current_user

    if @message.save
      redirect_to match_path(@match)
    else
      flash[:alert] = "Message vide ou invalide"
      redirect_to match_path(@match)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
