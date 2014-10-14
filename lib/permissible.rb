module Permissible

  AFFILIATE_AND_ADMIN_ACTIONS = [:view]
  ADMIN_ONLY_ACTIONS = [:edit]
  # User.first.may?(:edit, Org.first)
  # User.first.may?(:view, Org.first)
  def may?(action, subject)
    return true if superadmin?
    if ADMIN_ONLY_ACTIONS.include?(action)
      affiliate_for?(subject)
    elsif AFFILIATE_AND_ADMIN_ACTIONS.include?(action)
      admin_for?(subject) || affiliate_for?(subject)
    else
      admin_for?(subject)
    end
  end

  def superadmin?
    super_admin
  end

  # def is_student_in?(course)
  #   !may?('edit', coruse)
  # end

  # def has_limited_admin_access?
  #   return false if superadmin?
  #   permissions.instructor.any? || permissions.admin.any?
  # end

  def any_affiliate_permissions?
    permissions.affiliate.any?
  end

  def any_admin_permissions?
    permissions.admin.any?
  end

  def any_admin?
    superadmin? || any_admin_permissions?
  end

  # def all_partner_admin_quads
  #   quad_ids = permissions.admin.pluck(:grant_subject_id)
  #   Quad.where("id IN (?)", quad_ids)
  # end
  #
  # def all_instructor_courses
  #   Course.where("courses.id IN (?)", all_instructor_course_ids)
  # end
  #
  # def all_instructor_course_ids
  #   course_ids = permissions.instructor.pluck(:grant_subject_id)
  # end

  # User.first.grant("Admin", Org.first)
  def grant!(level, subject)
    p = permissions.create
    p.level = level
    p.org_id = subject.id
    p.save
  end

  # Revokes all permissions for a user / subject pair.
  def revoke!(subject)
    permissions.for_subject(subject).destroy_all
  end

  def affiliate_for?(subject)
    permissions.affiliate.for_subject(subject).present?
  end

  def admin_for?(subject)
    permissions.admin.for_subject(subject).present?
  end


end
