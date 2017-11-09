// Interrrupt Handler

#include "global_defs.h"

//volatile uint16_t heartbeat_tmr;
 
 void interrupt_low() {

  if (INTCON.TMR0IF) {
    heartbeat_tmr++;
    TMR0L = TMR_RELOAD_LOW;
    TMR0H = TMR_RELOAD_HIGH;
    INTCON.TMR0IF = 0;
  }
  //else if (INTCON.RBIF) {
    //counter++;
    //TMR0 = 96;
    //INTCON.RBIF = 0;
  //}
}