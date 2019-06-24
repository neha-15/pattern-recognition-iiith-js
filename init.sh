#!/bin/bash

branchName="develop"

if [ -d srip-quiz ]; then
    echo "srip-quiz already present"
    (cd srip-quiz; git checkout $branchName; git pull origin $branchName)
    echo "Copy quiz template"
    (cd srip-quiz; cp -rf src/quiz.html ../src/lab/; cp -rf src/quiz.html ../src/lab/exp3/;)
    echo "Copy quiz sources"
    (cd srip-quiz/src; cp -rf *.js *.css ../../src/lib/;)

else
    git clone -b $branchName https://github.com/virtual-labs/srip-quiz.git
    (cd srip-quiz)
    echo "Copy quiz template"
    (cd srip-quiz; cp -rf src/quiz.html ../src/lab/; cp -rf src/quiz.html ../src/lab/exp3/;)
    echo "Copy quiz sources"
    (cd srip-quiz/src; cp -rf *.js *.css ../../src/lib/;)
fi
