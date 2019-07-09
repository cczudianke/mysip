#include<eXosip2/eXosip.h>
#include<stdio.h>
#include<netinet/in.h>
void do_something(){

}
int main(void)
{
    int i;
    TRACE_INITIALIZE(6,stdout);
    struct eXosip_t* ctx = eXosip_malloc();
    i = eXosip_listen_addr(ctx,IPPROTO_UDP,NULL,2333,AF_INET,0);
    if(i != 0){
        eXosip_quit(ctx);
        fprintf(stderr,"could not initialize transport layer\n");
        return -1;
    }
    eXosip_event_t* je;
    for(;;){
        je = eXosip_event_wait(ctx,0,50);
        eXosip_lock(ctx);
        eXosip_automatic_action(ctx);
        eXosip_unlock(ctx);
        if(je == NULL) break;
        if(je->type == EXOSIP_CALL_MESSAGE_NEW){

        }
        else if(je->type == EXOSIP_CALL_ACK){

        }
        else if(je->type == EXOSIP_CALL_ANSWERED){

        }
        else{
            ;
        }

        do_something();
        eXosip_event_free(je);
    }
    
}