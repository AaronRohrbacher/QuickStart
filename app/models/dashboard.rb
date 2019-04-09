class Dashboard < ApplicationRecord
  def self.any_payable?(company)
    company.invoices.each { |i| return true if ["Awaiting Contract Payment", "Awaiting Payment"].include?(i.status.name) }
    false
  end

  def self.any_showable?(company)
    company.invoices.each { |i| return true if ["Awaiting Client Contract Approval", 
                                                "Awaiting Contract Payment", 
                                                "Contract Approved", 
                                                "Awaiting Client Project Approval", 
                                                "Awaiting Payment", 
                                                "Complete"]
                                                .include?(i.status.name) 
                          }
    false
  end
end