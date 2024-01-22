/* Copyright 2020 The MathWorks, Inc. */
//
// This custom main file is for Simulink model 'Controller'.
//
#include <stddef.h>
#include <stdio.h>                // For printf and fflush
#include "Controller.h"           // Model's header file
#include "rtwtypes.h"

#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <assert.h>
#include <mqueue.h>
#include <errno.h>

mqd_t mq;

class ControllerClassSendData_ControllerMsgT: public SendData_ControllerMsgT
{
  public:
    void SendData(const ControllerMsg* data, int32_T length, int32_T* status)
    {
        //This is an example of a message send service function
        
        int32_T id = data->deviceID;
        char idstr[5];
        sprintf(idstr,"%d",id);
        char qname[20] = "/DeviceQueue";
        strcat(qname,idstr);
        
        mqd_t cq = mq_open(qname, O_WRONLY| O_NONBLOCK);
        if (cq == -1) {
            printf("mq_open failed for send\n");
            return;
        }
        
        printf("Sending %d to device %d\n", data->command, id);
        mq_send(cq, (char*)data, length, 1);
        mq_close(cq);
    }
    
    ~ControllerClassSendData_ControllerMsgT() {
        // cleanup queues
        mq_close(mq);
        mq_unlink("/ControllerQueue");
    }
};
static ControllerClassSendData_ControllerMsgT controlmsgSendData_arg;

class ControllerClassRecvData_DeviceMsgT : public RecvData_DeviceMsgT
{
  public:
    void RecvData(DeviceMsg* data, int32_T length, int32_T* status)
    {
        int bytes = 0;
        if (mq == -1) {
            printf("mq_open failed\n");
            exit(1);
        }
        bytes = mq_receive(mq, (char *)data, length, NULL);
        if (bytes == length) {
            *status = 0;
            assert(data->deviceID > 0 && data->deviceID <= N);
            printf("Received %f from device %d\n",
                    data->temperature, data->deviceID);
        }
        else {
            if (bytes == -1 && errno != EAGAIN) {
                printf("receive error: %d\n", errno);
            }
            *status = 1;
        }
    }
};
static ControllerClassRecvData_DeviceMsgT tempmsgRecvData_arg;

// Instance of model class
static ControllerClass Controller_Obj(
    controlmsgSendData_arg, tempmsgRecvData_arg);

//
// Associating rt_OneStep with a real-time clock or interrupt service routine
// is what makes the generated code "real-time".  The function rt_OneStep is
// always associated with the base rate of the model.  Subrates are managed
// by the base rate from inside the generated code.  Enabling/disabling
// interrupts and floating point context switches are target specific.  This
// example code indicates where these should take place relative to executing
// the generated code step function.  Overrun behavior should be tailored to
// your application needs.  This example simply sets an error status in the
// real-time model and returns from rt_OneStep.
//
void rt_OneStep(void);
void rt_OneStep(void)
{
    static boolean_T OverrunFlag = false;
    
    // Disable interrupts here
    
    // Check for overrun
    if (OverrunFlag) {
        rtmSetErrorStatus(Controller_Obj.getRTM(), "Overrun");
        return;
    }
    
    OverrunFlag = true;
    
    // Save FPU context here (if necessary)
    // Re-enable timer or interrupt here
    // Set model inputs here
    
    // Step the model
    Controller_Obj.step();
    
    // Get model outputs here
    
    // Indicate task complete
    OverrunFlag = false;
    
    // Disable interrupts here
    // Restore FPU context here (if necessary)
    // Enable interrupts here
}

//
// The example "main" function illustrates what is required by your
// application code to initialize, execute, and terminate the generated code.
// Attaching rt_OneStep to a real-time clock is target specific.  This example
// illustrates how you do this relative to initializing the model.
//
int_T main(int_T argc, const char *argv[])
{
    // Unused arguments
    (void)(argc);
    (void)(argv);
    
    // Initialize the queue attributes
    struct mq_attr attr;
    attr.mq_flags = O_NONBLOCK;
    attr.mq_maxmsg = 10;
    attr.mq_msgsize = sizeof(DeviceMsg);
    attr.mq_curmsgs = 0;
    
    // Create the message queue
    mq_unlink("/ControllerQueue");
    mq = mq_open("/ControllerQueue", O_CREAT | O_RDONLY | O_NONBLOCK, 0644, &attr);
    if (mq == -1) {
        printf("mq_open failed\n");
        exit(1);
    }
    printf("Controller queue: %d\n",mq);
    
    
    // Initialize model
    Controller_Obj.initialize();
    
    // Attach rt_OneStep to a timer or interrupt service routine with
    //  period 1.0 seconds (the model's base sample time) here.  The
    //  call syntax for rt_OneStep is
    //
    //   rt_OneStep();

    fflush((NULL));
    while (rtmGetErrorStatus(Controller_Obj.getRTM()) == (NULL)) {
        //  Perform other application tasks here
        rt_OneStep();
        sleep(1);
    }
    
    // Terminate model
    Controller_Obj.terminate();
    
    return 0;
}
//
// [EOF]
//
