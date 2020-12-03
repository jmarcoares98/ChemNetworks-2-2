  #!/usr/bin/env bash
  NUM=${1?Error: no number given}
  INPUT=${2?Error: no input given}
  ARG1=${3?Error: no file given}
  ARG2=${4}
  ARG3=${5}
  
  echo "$ARG1 and $ARG2 and $ARG3"
  echo "here are test jobs for ChemNetworks-2.2"
 
  cp ChemNetworks-2.2.exe test-jobs/test$NUM/ChemNetworks-2.2.exe

  cd test-jobs/test$NUM
  ARGS="$INPUT $ARG1"  
  echo "test$NUM..."
  chmod +x ChemNetworks-2.2.exe
  ./ChemNetworks-2.2.exe $ARGS
  lab=$?
  if test $lab -eq 0; then
    echo "test$NUM passed"
  else 
    echo "test$NUM failed"
  fi
  echo""
