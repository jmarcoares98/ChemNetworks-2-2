  #!/usr/bin/env bash
  NUM=${1?Error: no number given}
  
  for ((i=2;i<=$#; i++))
  do
  ARG$i=${i}
  echo "ARG$i"
  ARGS.="ARG$i"
  ARGS.=" "
  done
 
  cp ChemNetworks-2.2.exe test-jobs/test$NUM/ChemNetworks-2.2.exe

  cd test-jobs/test$NUM

  echo "testing test$NUM..."
  chmod +x ChemNetworks-2.2.exe
  ./ChemNetworks-2.2.exe $ARGS
  lab=$?
  if test $lab -eq 0; then
    echo "test$NUM passed"
  else 
    echo "test$NUM failed"
  fi
  echo""
