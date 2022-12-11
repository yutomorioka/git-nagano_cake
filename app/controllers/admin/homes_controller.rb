class Admin::HomesController < ApplicationController
  def top
    @admin = Admin.all
  end
end
