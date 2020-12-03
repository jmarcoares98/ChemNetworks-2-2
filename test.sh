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
  pushd test$task
  echo "$?"
  echo "test$task..."
  read -p "Enter inputs : " ARGS
  chmod +x ChemNetworks-2.2.exe
  ./ChemNetworks-2.2.exe Input-test$task $ARGS
  lab=$?
  if test $lab -eq 0; then
    echo "test$task passed"
  else 
    break
  fi
  echo""
  popd
  done
