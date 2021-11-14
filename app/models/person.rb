# frozen_string_literal: true

class Person < ApplicationRecord
  include Filterable

  has_many :vehicles
  has_many :transfers, as: :seller
  has_many :transfers, as: :buyer

  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :address

  delegate :state, :city, :street, :district, :zip_code, :number, :complement, to: :address

  enum document_kind: { cpf: 0, cnpj: 1 }

  validates :name, :document_number, :address, presence: true

  scope :filter_by_transferable, -> { joins(:vehicles).where(vehicles: Vehicle.filter_by_transferable) }
  scope :filter_by_name, -> { order(name: :asc) }
  scope :filter_by_cpf, -> { cpf }
  scope :filter_by_cnpj, -> { cnpj }
end
