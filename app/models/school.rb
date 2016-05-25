class School < ActiveRecord::Base
  # Dependent Destroy will delete
  # all records in the has_many association
  # ** This is BEST practice **
  has_many :classrooms, dependent: :destroy
  has_one :address, dependent: :destroy


# validations go here
# second line of defense

#guides.rubyonrails.org/active_record_validations.html
# presence - most used on anything that you don't want nil
  validates_presence_of :name
# uniqueness - most used (e-mails and usernames)
# validates_uniqueness_of :name

# validates :year_built, inclusion: {in: (1900...2016)}
# validates :name, inclusion: {in: ['DPL', 'CodeSchool', 'DevMountain', 'LinSchool']}
# validates :name, length: {minimum: 2, maximum: 50}
# after_save :default_year_built

  # before_create :default_year_built

  # before_create
  # after_create

  # private

  # def default_year_built
  #   self.year_built = '2016' if self.year_built.empty?
  # end

end
