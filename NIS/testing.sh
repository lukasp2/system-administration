#!/bin/bash

# The ypwhich command shows which server the client is bound to (should be return 10.0.0.2)
OUTPUT=$(ypwhich)
if [[ $OUTPUT == "10.0.0.2" ]]; then
  echo "OK: ypwhich"
else
  echo "FAILED: ypwhich"
fi


