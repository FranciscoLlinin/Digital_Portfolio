class Experience < ApplicationRecord
    validates :company, :position, :start_date, :end_date, :description, presence: true
  end