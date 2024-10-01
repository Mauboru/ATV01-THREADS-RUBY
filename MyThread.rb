require 'securerandom'

class MyThread
    def initialize(i)
        @i = i
    end

    def run
        sleep(rand(1..5))
        puts "Olá, agora com classe!! #{@i}"
    end
end