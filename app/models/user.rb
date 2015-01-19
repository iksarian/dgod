class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  field :name, type: String
  field :email, type: String
  field :encrypted_password,  type: String
  field :current_sign_in_at,  type: Time
  field :last_sign_in_at,  type: Time
  field :current_sign_in_ip,  type: String
  field :last_sign_in_ip,  type: String
  field :sign_in_count,  type: Integer
  field :remember_created_at, type: Time
  has_many :characters
end
