// simulation.c
// simulation of feedback control of servomotor
//
// compile:
// gcc -m32 simulation.c -lrt -lm -o simulation
//
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <signal.h>
#include <unistd.h>

float kDt = 0.01;                       // interval time[sec]
float kJ = 5;                           // moment of inertia[Nms^2]
float kD = 0.1;                         // viscosity coef.[Nms]
float kK = 1;                           // spring constant[Nm]

struct timespec gStartTime;             // start time

// feedback controller with P (proportional) controll
float controller(float e)
{
    float kP = 100;                     // P gain
    return e * kP;                      // P controll
}

// servomotor model
float plant(float u)
{
    static float y = 0;                 // angle
    static float yd = 0;                // angular velocity
    float ydd;                          // angular acceleration

    ydd = (u - kD * yd - kK * y) / kJ;  // equation of motion (Euler method)
    yd = yd + ydd * kDt;
    y = y + yd * kDt;

    return y;
}

void intervalProc(int a)
{
    struct timespec curTime;            // current time
    float t;                            // current time[sec]
    static float y = 0;                 // process variable (PV)
    float u;                            // manipulative variable (MV)
    float e;                            // error
    float r;                            // set variable (SV)

    clock_gettime(CLOCK_REALTIME, &curTime);
    t = curTime.tv_sec - gStartTime.tv_sec
      + (curTime.tv_nsec - gStartTime.tv_nsec) * 1e-9;

    if (t > 10) {                       // finish in 10[sec]
        exit(0);
    }

    r = sin(t);                         // SV: sin(t)
    e = r - y;                          // error = SV - PV
    u = controller(e);                  // calculate MV
    y = plant(u);                       // controll motor

    printf("%4.2f %4.2f %4.2f\n", t, r, y);
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

