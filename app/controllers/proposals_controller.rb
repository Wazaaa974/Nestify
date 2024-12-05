class ProposalsController < ApplicationController

  def show
    @proposal = Proposal.find(params[:id])
  end

  def update
    @proposal = Proposal.find(params[:id])
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
    raise
  end
end
