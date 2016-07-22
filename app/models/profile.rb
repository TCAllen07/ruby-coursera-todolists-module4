# rails generate scaffold Profile gender:string birth_year:integer first_name:string last_name:string user:references
class Profile < ActiveRecord::Base
  belongs_to :user
  validate(:need_a_name)
  def need_a_name()
    if first_name == nil && last_name == nil
    # if first_name == '' && last_name == ''
      errors.add(:first_name, "Add a first name or last name")
    end
  end
  validate(:gender_check)
  def gender_check()
    if gender != 'male' && gender != 'female'
      errors.add(:gender, "Gender must be male or female")
    end
  end
  validate(:no_men_named_sue)
  def no_men_named_sue()
    if gender == 'male' && first_name == 'Sue'
      errors.add(:gender, "Are you sure? Is this a man named Sue?")
    end
  end

  def self.get_all_profiles(min_yr, max_yr)
    self.where("birth_year BETWEEN :min_yr AND :max_yr", min_yr: min_yr, max_yr: max_yr).order(:birth_year)
  end
end
