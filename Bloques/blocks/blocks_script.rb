10.times do |number|
  puts "5 x #{number+1} = #{(number+1)*5}"
end
#---------------------------
print_table= Proc.new do |number|
  puts "5 x #{number+1} = #{(number+1)*5}"
end

10.times &print_table

#--------------------------
full_name = Proc.new do |first,last|
  puts "#{first},  #{last}"
end
full_name.call('Araceli','Colmenero')
#---------------------
full_name1 = Proc.new do |first:name,last:surname|
  puts "#{last},  #{first}"
end
#otra forma de mandar llamar
full_name1.call(first:'Araceli',last:'Colmenero')
full_name1.call(last:'Colmenero',first:'Araceli')
#---------------------------------------------------
def load_users(database,&block)
  puts database
  puts block.class
  puts block.source_location
  puts block.parameters
  block.call(first:'Araceli',last:'Colmenero')
end

load_users('users.sqlite3',&full_name1)
#-----------------------------------------------
users= ['Maria','Ramon','Victor','Juan']
def last_user(users)
  yield(users.last.downcase) if block_given?
  users.last
end
last_user(users)do |user|
  puts "El ultimo usuario es: #{user}"
end
puts last_user(users)
#----------------------------------------------
full_name2 = Proc.new do |first:'Maria',last:'Sanchez',**list|
  puts "#{last},  #{first}: #{list}"
end
#otra forma de mandar llamar
full_name2.call(first:'Araceli',last:'Colmenero',birth:1990,male:false)
full_name2.call(birth:2015,male:true)
#-------------------------------------------------
full_name3 = lambda do |first:'Maria',last:'Sanchez',**list|
  puts "#{last},  #{first}: #{list}"
end
#otra forma de mandar llamar
full_name3.call(first:'Araceli',last:'Colmenero',birth:1990,male:false)
full_name3.call(birth:2015,male:true)
#------------------------------------------------------------------
block_proc=proc do |a, b|
  [a,b]
end
block_lambda= lambda do |a, b|
  [a, b]
end

#p block_proc.call('A',true,2)
#p block_proc.call('A')
#p block_proc.call(['A',true])

p block_lambda.call('A',true,2)
p block_lambda.call('A')
p block_lambda.call(['A',false])

p block_proc.lambda?
p block_lambda.lambda?