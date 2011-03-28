class AlterCourseConfigurationForPeerEvaluations < ActiveRecord::Migration
  def self.up

    rename_column :courses, :configure_peer_evaluation_date1, :peer_evaluation_first_email
    rename_column :courses, :configure_peer_evaluation_date2, :peer_evaluation_second_email

    add_column :courses, :updated_by_user_id, :integer
    
  end

  def self.down
    remove_column :courses, :updated_by_user_id


    rename_column :courses, :peer_evaluation_second_email, :configure_peer_evaluation_date2
    rename_column :courses, :peer_evaluation_first_email, :configure_peer_evaluation_date1
  end
end