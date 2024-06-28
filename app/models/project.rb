class Project < ApplicationRecord
    validates :name, :description, :technologies, presence: true
  end