class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  composed_of :full_name,
              class_name: "FullName",
              mapping:  [%w(family_name familyname), %w(first_name firstname)]

  has_many :wants
end

class FullName
  attr_reader :first_name, :family_name

  def initialize(first_name, family_name)
    @first_name = first_name
    @family_name = family_name
  end

  def to_s
    [@first_name, @family_name].compact.join(" ")
  end
end
