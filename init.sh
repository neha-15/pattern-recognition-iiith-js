#!/bin/bash

branchName="master"

if [ -d srip-quiz ]; then
    echo "srip-quiz already present"
    (cd srip-quiz; git checkout $branchName; git pull origin $branchName)
    echo "copying quiz json"
    (cp quiz-data.json srip-quiz/src/Quiz/;)
    echo "updated quiz json"
    (cd srip-quiz/src/Quiz; )

else
    git clone -b $branchName https://github.com/virtual-labs/srip-quiz.git
    echo "copying quiz json"
    (cp quiz-data.json srip-quiz/src/Quiz/;)
    echo "updated quiz json"
    (cd srip-quiz/src/Quiz; )
fi
