require 'thread'
require 'securerandom'
require_relative 'MyThread'

def imprime(i)
    sleep(rand(1..5))
    puts "Olá Mundo - #{i}"
end

# (1/3) Recriar o código com apenas uma THREAD
puts "\nIniciando o processo 01\n\n"
i = 0
t1 = Thread.new { imprime(i) }
t1.join

# (2/3) Recriar o código com 10 THREADS
puts "\nIniciando o processo 02\n\n"
threads = []
(0..9).each do |a|
  thread = Thread.new { imprime(a) }
  threads << thread
end
threads.each(&:join)

# (3/3) Recriar o código com 10 classes
puts "\nIniciando o processo 03\n\n"
threads = []
10.times do |a|
  thread = Thread.new do
    MyThread.new(a).run
  end
  threads << thread
end
threads.each(&:join)

print "\nFinalizando o processo!\n"