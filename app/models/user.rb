class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tickets

  enum status: [:active, :blocked]

  validates_presence_of :block_reason, if: :blocked?

  before_save :clear_block_reason, if: :active?

  def able_to_delete?
    (tickets.try(:last).try(:title) =~ /Delete/) && (balance == 0)
  end

  private

  def clear_block_reason
    block_reason = ''
  end
end
