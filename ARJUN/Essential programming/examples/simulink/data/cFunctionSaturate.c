/* Copyright 2020 The MathWorks, Inc. */
#include <math.h>
#include "cFunctionSaturate.h"

/* This function saturates the input value between clipVal and -1*clipVal */
double customSaturateFcn(double in, double clipVal)  {
    double outVal = fabs(in) > clipVal ? clipVal : in;
    return copysign(outVal, in);
}