# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
  SELECT 
    DISTINCT a.yr
  FROM
    nobels AS a
  LEFT JOIN 
    nobels AS b ON a.yr = b.yr
  WHERE
    a.subject = 'Physics'
    AND b.subject != 'Chemistry'    
  SQL
end
