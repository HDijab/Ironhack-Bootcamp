module ApplicationHelper
  def flash_message
    unless flash.empty?
      flash.to_hash.values.join
    end
  end
end
