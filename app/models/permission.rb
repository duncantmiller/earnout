class Permission < ActiveRecord::Base
  belongs_to :user
  belongs_to :org

  scope :admin, -> { where "level = 'Admin'" }
  scope :affiliate, -> { where "level = 'Affiliate'" }

  def self.for_subject(subject)
    where(org_id: subject.id)
  end

  def self.all_affiliates
    user_ids = Permission.where(level: 'Affiliate').pluck(:user_id)
    User.where("id IN (?)", user_ids)
  end

  def self.all_admins
    user_ids = Permission.where(level: 'Admin').pluck(:user_id)
    User.where("id IN (?)", user_ids)
  end

end

# examples of usage:
#
# bob = Person.find(123)
#
# bob.grant!("Instructor", Course.find(456))
#
# course_ids = bob.permissions.instructor.course.pluck(:grant_subject_id)
#
# events = Event.where("course_id IN (?)", course_ids)
