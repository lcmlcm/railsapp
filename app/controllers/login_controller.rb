class LoginController < ApplicationController
  def login
  end
  def showlogin

  end
  def validate

    @account = Account.new(login_params)
    username = @account.username
    password = @account.password
    @msg = "login success!"
    @acc = Account.find_by_username(username)
    if @acc.class == NilClass
      @msg = "unregisted user!"
    elsif @acc.password == password
    else
      @msg = "login failed, please check the username and password!"
    end
    flash[:msg] = @msg
    redirect_to :controller => 'login', :action => 'showlogin'


  end



  def loginout

  end
  private
  def login_params
    params.require(:account).permit(:username, :password)
  end
end
