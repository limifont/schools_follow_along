class School < ActiveRecord::Base
  # Dependent Destroy will delete
  # all records in the has_many association
  # ** This is BEST practice **
  has_many :classrooms, dependent: :destroy
  has_one :address, dependent: :destroy

  # validations go here
  # http://guides.rubyonrails.org/active_record_validations.html
  # second line of defense for bad data
  # presence - most used on anything that you don't want nil
  validates_presence_of :name
  # uniqueness - most used on emails / usernames
  validates_uniqueness_of :name

  # used but not super often
  # inclusion
  # validates :name, inclusion: {in: ['DPL', 'CodeSchool', 'DevMountain']}
  # length
  # validates :name, length: {minimum: 2, maximum: 50}
  # numericality
  # validates :year_built, numericality: {only_integer: true}
  before_create :default_year_built
  
  # better use case for callbacks
  # before_save :encrypt_credit_card_number

  private
    # callbacks go here
    # http://guides.rubyonrails.org/active_record_callbacks.html
    # you probably wont use these much in basic rails apps

    def default_year_built
      self.year_built = '2016' if self.year_built.empty?
    end

    # def encrypt_credit_card_number
    #   self.credit_card_number.encrypt
    # end
end

