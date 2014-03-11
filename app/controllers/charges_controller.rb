class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 1500

    customer = Stripe::Customer.create(
      email: current_user.email,
      card:  params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer:    customer.id,
      amount:      @amount,
      description: params[:description],
      currency:    'usd'
    )

    id = params[:snap_id]
    snap = Snap.find(id)

    UserMailer.thanks_email(current_user, snap).deliver

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
