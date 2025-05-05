class SwipesController < ApplicationController
  before_action :authenticate_user!

  def index
    # Trouver les utilisateurs que l'on n'a pas encore swipés
    swiped_ids = current_user.given_swipes.pluck(:to_user_id)
    @potential_matches = User.where.not(id: swiped_ids + [current_user.id]).limit(1)
  end

  def create
    swipe = current_user.given_swipes.new(to_user_id: params[:to_user_id], like: params[:like])

    if swipe.save
      # Si l'autre utilisateur a aussi liké, créer un match
      if swipe.like && Swipe.exists?(from_user_id: swipe.to_user_id, to_user_id: swipe.from_user_id, like: true)
        Match.create(user1_id: current_user.id, user2_id: swipe.to_user_id)
      end
      redirect_to root_path, notice: "Swipe enregistré"
    else
      redirect_to root_path, alert: "Erreur lors du swipe"
    end
  end
end
