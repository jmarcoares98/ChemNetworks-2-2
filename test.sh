  #!/usr/bin/env bash
  ARG1=${1?Error: no input given}
  ARG2=${2?Error: no input given}
  ARG3=${3?Error: no input given}
  
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
  case $task in
  1) ARGS="$ARG1" ;;
  2) ARGS="$ARG1 $ARG2" ;;
  3) ARGS="$ARG1 $ARG2 $ARG3" ;;
  4) ARGS="$ARG1 $ARG3 $ARG2" ;;
  esac
  pushd test$task
  echo "test$task..."
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
