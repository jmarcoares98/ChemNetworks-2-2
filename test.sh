  #!/bin/sh
  echo "here are test jobs for ChemNetworks-2.2"
  for i in {1..4}
  do
    cp ChemNetworks-2.2.exe test-jobs/test$i/ChemNetworks-2.2.exe
  done
  
  cd test-jobs
  for task in {1..4}
  do
  case $task in
    1) ARGS="water.xyz" ;;
    2) ARGS="water1.xyz solB1.xyz" ;;
    3) ARGS="water1.xyz solB1.xyz solC1.xyz" ;;
    4) ARGS="water1.xyz solC1 solB1.xyz" ;;
  esac
  pushd test$task
  echo "test$task..."
  chmod +x ChemNetworks-2.2.exe
  ./ChemNetworks-2.2.exe Input-test$task $ARGS
  popd
  done
