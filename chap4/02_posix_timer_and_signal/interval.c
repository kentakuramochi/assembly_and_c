// interval.c
//
// compile:
// $ gcc -m32 interval.c -lrt -o interval
//
#include <stdio.h>
#include <time.h>
#include <signal.h>
#include <unistd.h>

// interval procedure (signal handler)
void intervalProc(int a)
{
    fprintf(stderr, ".");
}

int main(int argc, char *argv[])
{
    timer_t timerid;
    struct sigaction action;
    struct itimerspec itimer;

    // set interval event
    action.sa_handler = intervalProc;
    action.sa_flags = 0;
    sigaction(SIGALRM, &action, NULL);

    // set timer to send signal every 100ms
    timer_create(CLOCK_REALTIME, NULL, &timerid);
    itimer.it_interval.tv_sec = 0;
    itimer.it_interval.tv_nsec =100e6;
    itimer.it_value.tv_sec = 0;
    itimer.it_value.tv_nsec = 100e6;
    timer_settime(timerid, 0, &itimer, NULL);

    // wait signal
    while (1) {
        sleep(1);
    }

    return 0;
}
