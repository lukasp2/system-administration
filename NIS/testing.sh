#!/bin/bash

# When testing NIS at this point, when you have no clients, you may need to use the ypbind command manually 
# to bind to the server. The ypcat command is useful to read the contents of a NIS map. The ypwhich command 
# shows which server the client is bound to.

ypwhich
