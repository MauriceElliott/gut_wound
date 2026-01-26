#include "pd_api.h"
#include <stdio.h>

static PlaydateAPI* pd = NULL;

static int update(void* userdata) {
    // Clear screen
    pd->graphics->clear(kColorWhite);
    // Draw "Hello World" text
    const char* text = "Hello World from C!";
    pd->graphics->drawText(text, strlen(text), kASCIIEncoding, 100, 120);
    
    return 1;
}

int eventHandler(PlaydateAPI* playdate, PDSystemEvent event, uint32_t arg) {
    if (event == kEventInit) {
        pd = playdate;
        
        // Set up update callback
        pd->system->setUpdateCallback(update, NULL);
        
        // Log to console
        pd->system->logToConsole("Gutwound C initialized!");
    }
    
    return 0;
}
