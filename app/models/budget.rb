require 'securerandom'

class Budget < ApplicationRecord
  self.primary_key = :id

  before_create :generate_id

  private

  def generate_id
    self.id ||= SecureRandom.uuid
  end
end
