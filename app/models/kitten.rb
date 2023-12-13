class Kitten < ApplicationRecord
  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "=> Oops! It looks like your kitten's name is feeling a bit shy. Please use letters for the name—no numbers, symbols, or paw prints allowed!" }
  validates :age, presence: true, format: { with: /\d/, message: "=> Meowch! The age field should be a number representing your kitten's purrfect years. Please enter a numerical value, like '3' or '5." }
  validates :cuteness, presence: true
  validates :softness, presence: true
end
