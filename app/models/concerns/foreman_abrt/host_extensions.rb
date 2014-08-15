module ForemanAbrt::HostExtensions
  extend ActiveSupport::Concern

  included do
    has_many :abrt_reports, :dependent => :destroy, :foreign_key => "host_id"
  end

  def recent_abrt_reports
    abrt_reports.where(:created_at => (Time.now - 1.month)..Time.now)
  end

  #module ClassMethods
  #  # create or overwrite class methods...
  #  def class_method_name
  #  end
  #end

end
