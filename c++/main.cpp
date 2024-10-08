#include <iostream>
#include <thread>
#include <vector>
#include <chrono>
#include <cstdlib>
#include <ctime>

void imprime(int i) {
    std::this_thread::sleep_for(std::chrono::seconds(rand() % 5 + 1));
    std::cout << "Ola Mundo - " << i << std::endl;
}

class MyThread {
public:
    MyThread(int id) : id_(id) {}

    void run() {
        std::this_thread::sleep_for(std::chrono::seconds(rand() % 5 + 1));
        std::cout << "Ola agora com Classe!! - " << id_ << std::endl;
    }

private:
    int id_;
};

int main() {
    srand((unsigned) time(0));

    // (1/3) Recriar o código com apenas uma THREAD
    std::cout << "\nIniciando o processo 01\n\n";
    std::thread t1(imprime, 0);
    t1.join();

    // (2/3) Recriar o código com 10 THREADS
    std::cout << "\nIniciando o processo 02\n\n";
    std::vector<std::thread> threads;

    for (int i = 0; i < 10; ++i) {
        threads.emplace_back(imprime, i);
    }

    for (auto &t : threads) {
        t.join();
    }

    // (3/3) Recriar o código com 10 classes
    std::cout << "\nIniciando o processo 03\n\n";
    std::vector<std::thread> classThreads;

    for (int i = 0; i < 10; ++i) {
        classThreads.emplace_back([i]() {
            MyThread t(i);
            t.run();
        });
    }

    for (auto &t : classThreads) {
        t.join();
    }

    std::cout << "\nFinalizando o processo!\n";
    return 0;
}