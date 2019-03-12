class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tickets

  enum status: [:active, :blocked]
  validates_presence_of :status
  validates_presence_of :block_reason, if: :blocked?
  validate :able_to_delete?, on: :delete

  def able_to_delete?
    ((tickets.try(:last).try(:title) =~ /Delete/) != nil)  && (balance == 0)
  end

end
