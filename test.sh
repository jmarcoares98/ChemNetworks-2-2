  #!/bin/sh
  echo "here are test jobs for ChemNetworks-2.2"
 
  for ((i=1; ;++i))
  do
  cp ChemNetworks-2.2.exe test-jobs/test$i/ChemNetworks-2.2.exe
  lab=$?
  if test $lab -ne 0; then
    break
  else
    echo "cp test$i"
  fi
  done

  cd test-jobs
  for ((task=1; ;++task))
  do
  read -p "Enter inputs : " ARGS
  pushd test$task
  echo "test$task..."
  chmod +x ChemNetworks-2.2.exe
  ./ChemNetworks-2.2.exe Input-test$task $ARGS
  lab=$?
  echo ""
  if test $lab -eq 0; then
    echo "test$task passed"
  else 
    break
  fi
  popd
  done
