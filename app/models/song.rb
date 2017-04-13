# class YearValidator < ActiveModel::Validator
#   def validate(record)
#     current_year = Time.new.year
#     if record.released #if the record is released then release year must be true
#       unless record.release_year <= current_year && record.release_year != nil
#         record.errors[:release_year] << "please input valid year"
#       end
#     end
#     # binding.pry
#   end
# end

class Song < ActiveRecord::Base
  @current_year = Time.new.year
  validates :title , presence: true
  validates :released, presence: true
  validates :title, uniqueness: {scope: [:release_year, :artist_name]}
  validates :release_year, numericality: { less_than_or_equal_to: @current_year }
end
