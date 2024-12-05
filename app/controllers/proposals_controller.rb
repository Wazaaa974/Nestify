class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:update, :destroy]

  def show
    @proposal = Proposal.find(params[:id])
  end

  def update
    @proposal.favorite = !@proposal.favorite
    @proposal.save
    @message = @proposal.favorite ? "Ajouté dans favoris !" : "Retiré de favoris !"
    respond_to do |format|
      format.html { redirect_to package_path(@proposal.package), notice: @message }
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("proposal-#{@proposal.id}", partial: "shared/favorite_button", locals: { proposal: @proposal }),
          turbo_stream.prepend("flashes", partial: "shared/flashes", locals: { notice: @message })
        ]
      end
    end
  end

  def destroy
    decrease_proposal_total
    if @proposal.destroy
      flash[:proposal] = "Génial, ton nid va être chouette !"
      redirect_to dashboards_path, status: :see_other
    else
      render "dashboards/index", status: :unprocessable_entity
    end
  end

  def decrease_proposal_total
    User.find(current_user.id).update(budget: current_user.budget - @proposal.package.budget)
  end

  private

  def proposal_params
    params.require(:proposal).permit(:bought, :package_id, :user_id, :favorite)
  end

  def set_proposal
    @proposal = Proposal.find(params[:id])
  end
end
