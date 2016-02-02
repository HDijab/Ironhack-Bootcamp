class Contact < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, url: "/assets/images/:basename.:extension",
         :path => ":rails_root/assets/images/:basename.:extension",
         :default_url => "/assets/images/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  def self.valid?(params={})
    puts params[:email].match(/^.[^\s]@.\.com$/) == nil
    return false if params[:name] == ''
    return false if params[:address] == ''
    return false if params[:phone].to_i == 0 || params[:phone].length < 7
    return false if params[:email].match(/^.[^\s]@.\.com$/) != nil
    true
  end
end
