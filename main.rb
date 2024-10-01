require 'thread'
require 'securerandom'
require_relative 'MyThread'

def imprime(i)
    sleep(rand(1..5))
    puts "Olá Mundo - #{i}"
end

# Recriar o código com apenas uma THREAD
puts "\nIniciando o processo 01\n"
i = 0
t1 = Thread.new { imprime(i) }
t1.join

# Recriar o código com 10 THREADS
puts "\nIniciando o processo 02\n"
threads = []
(0..9).each do |a|
  thread = Thread.new { imprime(a) }
  threads << thread
end
threads.each(&:join)

# Recriar o código com 10 classes
puts "\nIniciando o processo 03\n"
threads = []
10.times do |a|
  thread = Thread.new do
    MyThread.new(a).run
  end
  threads << thread
end
threads.each(&:join)

print "\nFinalizando o processo!\n"