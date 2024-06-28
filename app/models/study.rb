class Study < ApplicationRecord
    validates :institution, :degree, :start_date, :end_date, :description, presence: true
  end