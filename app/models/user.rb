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
  field :is_gm, type: Boolean, default: false
  has_many :characters
  embeds_many :items
  validates_presence_of :name, :email, :encrypted_password 
  validates_uniqueness_of :name, :email
  validates_length_of :name, minimum:1, maximum:16
  validates_format_of :name, with: /\A\w+\z/
end
