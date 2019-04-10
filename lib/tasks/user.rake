namespace :user do
  desc "TODO"
  task create: :environment do
    puts 'Enter e-mail address'
    email_input = STDIN.gets.strip
    password_generated = Devise.friendly_token.first(20)
    puts 'Enter First Name'
    first_name_input = STDIN.gets.strip
    puts 'Enter Last Name'
    last_name_input = STDIN.gets.strip
    puts 'Enter Company ID'
    company_id_input = STDIN.gets.strip.to_i

    puts '------'
    puts 'Review:'
    puts "email: #{email_input}"
    puts "First Name: #{first_name_input}"
    puts "Last Name: #{last_name_input}"
    puts "Company: #{Company.find(company_id_input).name}"
    puts '------'
    puts 'Look good? (Y/N)'
    confirm = STDIN.gets.strip
    puts confirm

    if confirm === 'Y'
      company = Company.find(company_id_input)
      if created_user = company.users.create!(email: email_input, password: password_generated, first_name: first_name_input, last_name: last_name_input)
        puts 'USER CREATED AND ASSOCIATED TO COMPANY'
        UserMailer.with(user: created_user).welcome_email.deliver_now
        puts 'WELCOME EMAIL SENT'
        created_user.send_reset_password_instructions
        puts 'PASSWORD RESET EMAIL SENT'
      else
        puts 'SOMETHING WENT WRONG'
      end
    else
      puts "Ok, try again."
    end
  end

end
