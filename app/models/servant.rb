class Servant < ActiveRecord::Base
  def protocol
    if self[:protocol] and not self[:protocol].empty?
      self[:protocol]
    else
      "http"
    end
  end
  
  def name
    self[:name].blank? ? host.sub(/\.(com|org).*$/,'').titleize : self[:name].titleize
  end
end
