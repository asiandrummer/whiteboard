class EffortLogMailer < ActionMailer::Base

  default :from => 'scotty.dog@sv.cmu.edu',
          :bcc => "rails.app@sv.cmu.edu"

  def midweek_warning(saying, user)
    @user = user
    email_with_name = @user.human_name + ' <' + @user.email + '>'


#    <YourAppName>::Application.assets.find_asset('ScottyDogLandscape.jpg').pathname
#    attachments["ScottyDogLandscape.jpg"] = File.read("#{Rails.root}/assets/images/ScottyDogLandscape.jpg")
    attachments["ScottyDogLandscape.jpg"] = Rails.application.assets.find_asset('ScottyDogLandscape.jpg')
    mail(:to => @user.email, :subject => "Scotty Dog says: #{saying}", :date => Time.now)

  end

  def midweek_warning_admin_report(saying, people_without_effort, people_with_effort)
    @saying = saying
    @people_without_effort = people_without_effort
    @people_with_effort = people_with_effort
    #consider using an list array for this up e.g EmailsArray.all.map(&:email).join(", ")
    faculty = ['todd.sedano@sv.cmu.edu', 'ed.katz@sv.cmu.edu', 'mel.rosso-llopart@sv.cmu.edu']

    mail(:to => faculty, :subject => "Scotty Dog Midweek Warning Email Summary", :date => Time.now)
  end

  def endweek_admin_report(course_id, course_name, faculty_emails)
    @course_id = course_id
    @course_name = course_name

    mail(:to => faculty_emails, :subject => "Effort log data updated for #{course_name}", :date => Time.now)
  end

end



