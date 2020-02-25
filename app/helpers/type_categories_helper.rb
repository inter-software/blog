# frozen_string_literal: true

module TypeCategoriesHelper # rubocop:todo Style/Documentation
  def mostrar_Audience(audience) # rubocop:todo Naming/MethodName
    if audience
      'Adulto'
    else
      'Infantil'
    end
  end
end
