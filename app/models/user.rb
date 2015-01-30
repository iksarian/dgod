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
  field :gold, type: Integer, default: 0
  has_many :characters
  belongs_to :fight
  embeds_many :items
  validates_presence_of :name, :email, :encrypted_password 
  validates_uniqueness_of :name, :email
  validates_length_of :name, minimum:1, maximum:16
  validates_format_of :name, with: /\A\w+\z/
  validates_numericality_of :gold

  def buy_item(item)
   if self.gold >= item.price
     self.items.create(name: item.name, damage: item.damage, mf: item.mf, ac: item.ac, mr: item.mr, price: item.price, bonus: item.bonus, classes: item.classes, quality: item.quality, equipment_type: item.equipment_type)
     unless self.is_gm
       self.gold -= item.price
       self.save
     else
       true
     end
   else
     false
   end
  end
  def sell_item(item)
    gold_gained = (item.price/2)
    self.gold += gold_gained
    item.destroy
    self.save
  end
end
