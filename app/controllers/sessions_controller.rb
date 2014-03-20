class SessionsController < ApplicationController
    def new
      # renderši kirjautumissivun
    end

  def create
      user = User.find_by username: params[:username]
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to :root, notice: "Dobrodosao/la nazad!"
      else
        redirect_to :back, notice: "Korisnicko ime ili lozinka se ne poklapaju"
      end
  end

    def destroy
      # nollataan sessio
      session[:user_id] = nil
      # uudelleenohjataan sovellus pŠŠsivulle 
      redirect_to :root
    end
end