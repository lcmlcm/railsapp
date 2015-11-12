class AccountsController < ApplicationController
  def new
    @account = Account.new

  end
  def create
    @account = Account.new(account_params)


    if @account.save
    redirect_to :action => :show, :id => @account
    else
      render :action => :new
    end
  end

  def show
    @account = Account.find(params[:id])
  end

  private
  def account_params
    params.require(:account).permit(:username, :password)
  end
end
