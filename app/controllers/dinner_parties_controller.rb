class DinnerPartiesController < ApplicationController

   def index
      @dinner_parties = DinnerParty.all
   end

   def show
      @dinner_party = DinnerParty.find(params[:id])

   end

   def new
      if logged_in?
      @dinner_party = DinnerParty.new
      else
      redirect_to login_path
      end
   end

   def create
      @dinner_party = DinnerParty.create(dinner_party_params)
      redirect_to dinner_party_path(@dinner_party.id)

   end

   def edit
        @dinner_party = DinnerParty.find(params[:id])
   end

   def update
        @dinner_party = DinnerParty.update(dinner_party_params)
        redirect_to dinner_party_path(@dinner_party)
   end

   def destroy
        DinnerParty.find(params[:id]).destroy
        redirect_to user_path(current_user)
   end

   private

   def dinner_party_params
      params.require(:dinner_party).permit(:user_id, :name, :date, :location, :cuisine, :max_guests, :price_per_guest)

   end

end
