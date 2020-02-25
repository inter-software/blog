# frozen_string_literal: true

module VerifiedsHelper # rubocop:todo Style/Documentation
  def getDateTime # rubocop:todo Naming/MethodName
    Time.now.strftime('%d-%m-%Y %H:%M')
  end
end
