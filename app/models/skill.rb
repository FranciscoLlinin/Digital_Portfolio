class Skill < ApplicationRecord
    validates :name, presence: true
    validates :percentage, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  
    def category
      case percentage
      when 0..20
        'Principiante'
      when 21..40
        'Intermedio'
      when 41..60
        'Hábil'
      when 61..80
        'Avanzado'
      else
        'Experto'
      end
    end
  end