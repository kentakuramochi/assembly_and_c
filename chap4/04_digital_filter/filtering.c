// filering.c
// implementation of IIR filter
//
// compile:
// gcc -m32 filtering.c -lrt -lm -o filtering
//
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <signal.h>
#include <unistd.h>

struct timespec gStartTime;         // start time
float kDt = 0.01;                   // interval time[sec]

// IIR filter designed by scilab
// @ 1st-order butterworth filter
// @ 9~11[Hz] band-pass, 100[Hz] interval
//                                      (delta: not used)
// > iir(1, 'bp', 'butt', [0.09, 0.11], [0.08, 0.03])
float iirFilter(float u0)
{
    // input: u[k], output: y[k]
    static float u1 = 0;            // u[k-1]
    static float u2 = 0;            // u[k-2]
    static float y1 = 0;            // y[k-1]
    static float y2 = 0;            // y[k-2]
    float y0;

    // difference equation
    y0 = -0.0591907 * u2 + 0.0591907 * u0
         -0.8816186 * y2 + 1.5252712 * y1;

    y2 = y1;
    y1 = y0;
    u2 = u1;
    u1 = u0;

    return y0;
}

void intervalProc(int a)
{
    struct timespec curTime;
    float t;
    float u;
    float y;

    clock_gettime(CLOCK_REALTIME, &curTime);
    t = curTime.tv_sec - gStartTime.tv_sec
      + (curTime.tv_nsec - gStartTime.tv_nsec) * 1e-9;

    if (t > 10) {
        exit(0);
    }

    // input signal
    u = sin(2 * M_PI * 20 * t) + sin(2 * M_PI * 10 * t)
      + sin(2 * M_PI * 5 * t) + sin(2 * M_PI * 3 * t)
      + drand48() * 2 - 1;

    // filtering
    y = iirFilter(u);

    printf("%4.2f %4.2f %4.2f\n", t, u, y);
}

int main(int argc, char *argv[])
{
    timer_t timerid;
    struct sigaction action;
    struct itimerspec itimer;

    // set interval procedure
    action.sa_handler = intervalProc;
    action.sa_flags   = 0;
    sigemptyset(&action.sa_mask);
    sigaction(SIGALRM, &action, NULL);

    // set timer: kDt[sec] interval
    timer_create(CLOCK_REALTIME, NULL, &timerid);
    itimer.it_interval.tv_sec  = (int)kDt;
    itimer.it_interval.tv_nsec = (kDt - (int)kDt) * 1e9;
    itimer.it_value.tv_sec     = (int)kDt;
    itimer.it_value.tv_nsec    = (kDt - (int)kDt) * 1e9;
    timer_settime(timerid, 0, &itimer, NULL);

    // get current time (UNIX time)
    clock_gettime(CLOCK_REALTIME, &gStartTime);

    // wait signal
    while (1) {
        sleep(1);
    }

    return 0;
}
