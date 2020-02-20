# frozen_string_literal: true

class HomeController < ApplicationController # rubocop:todo Style/Documentation
  skip_before_action :authenticate_user!, only: [:index]

  def index; end
end
