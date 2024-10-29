#include <iostream>
#include <gtest/gtest.h>

#include <pcosynchro/pcologger.h>
#include <pcosynchro/pcomutex.h>
#include <pcosynchro/pcosemaphore.h>
#include <pcosynchro/pcothread.h>

static int nbRuns = 0;
static PcoMutex mutex;

PcoSemaphore synchroSemaphore(0);

void taskRunSemaphore(int id) {
    // TODO : Wait here to start
    synchroSemaphore.acquire();

    mutex.lock();
    nbRuns ++;
    mutex.unlock();
    logger() << "Tache" << id << "executes" << '\n';
}

TEST(Synchro, Semaphore)
{
    const int NB_THREADS = 2;
    std::vector<std::unique_ptr<PcoThread>> threads(NB_THREADS);

    nbRuns = 0;

    for (int i = 0; i < NB_THREADS; i++) {
        threads[i] = std::make_unique<PcoThread>(taskRunSemaphore, i);
    }

    PcoThread::usleep(1000000);

    EXPECT_EQ(nbRuns, 0);

    // TODO : Release the threads
    for(int i = 0; i < NB_THREADS; i++) {
        synchroSemaphore.release();
    }

    for (int i = 0; i < NB_THREADS; i++) {
        threads[i]->join();
    }

    EXPECT_EQ(nbRuns, NB_THREADS);
}

PcoMutex synchroMutex;

void taskRunMutex(int id) {
    // TODO : Wait here to start
    synchroMutex.lock();
    synchroMutex.unlock();

    mutex.lock();
    nbRuns ++;
    mutex.unlock();
    logger() << "Tache" << id << "executes" << '\n';
}

TEST(Synchro, Mutex)
{
    const int NB_THREADS = 2;
    std::vector<std::unique_ptr<PcoThread>> threads(NB_THREADS);

    nbRuns = 0;

    synchroMutex.lock();

    for (int i = 0; i < NB_THREADS; i++) {
        threads[i] = std::make_unique<PcoThread>(taskRunMutex, i);
    }

    PcoThread::usleep(1000000);

    EXPECT_EQ(nbRuns, 0);

    // TODO : Release the threads
    synchroMutex.unlock();


    for (int i = 0; i < NB_THREADS; i++) {
        threads[i]->join();
    }

    EXPECT_EQ(nbRuns, NB_THREADS);
}



int main(int argc, char **argv) {
    testing::InitGoogleTest(&argc, argv);
    logger().initialize(argc, argv);
    return RUN_ALL_TESTS();
}

