#!/bin/bash

  awk -v c=1 'NR==1 { b=$2 } { printf( "%0.2f\t%0.6f\n", $1,( $2-b ) * c ) }' gsfe_ori > gsfe
