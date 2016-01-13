class ThemeSerializer < ActiveModel::Serializer
  attributes :name

  has_many :questions
end
