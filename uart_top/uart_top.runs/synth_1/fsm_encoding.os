
 add_fsm_encoding \
       {uart_tx.state} \
       { }  \
       {{000 000} {001 001} {010 010} {011 011} {100 100} }

 add_fsm_encoding \
       {uart_rx.state} \
       { }  \
       {{000 00} {001 01} {010 10} {011 11} }
