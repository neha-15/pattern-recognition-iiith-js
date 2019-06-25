#!/bin/bash

branchName="develop"

if [ -d srip-quiz ]; then
    echo "srip-quiz already present"
    (cd srip-quiz; git checkout $branchName; git pull origin $branchName)
    echo "Copy quiz template"
    (cd srip-quiz; rsync -avz --progress src/quiz.html ../src/lab/; rsync -avz --progress src/quiz.html ../src/lab/exp3/;)
    echo "Copy quiz json"
    (cd srip-quiz; rsync -avz --progress src/quiz-data.json ../src/lab/; rsync -avz --progress src/quiz-data.json ../src/lab/exp3/;)
    echo "Copy quiz sources"
    (cd srip-quiz/src/libs; rsync -avz --progress *.js *.css ../../../src/libs/;)

else
    echo "Cloning quiz"
    git clone -b $branchName https://github.com/virtual-labs/srip-quiz.git
    (cd srip-quiz)
    echo "Copy quiz template"
    (cd srip-quiz; rsync -avz --progress src/quiz.html ../src/lab/; rsync -avz --progress src/quiz.html ../src/lab/exp3/;)
    echo "Copy quiz json"
    (cd srip-quiz; rsync -avz --progress src/quiz-data.json ../src/lab/; rsync -avz --progress src/quiz-data.json ../src/lab/exp3/;)
    echo "Copy quiz sources"
    (cd srip-quiz/src/libs; rsync -avz --progress *.js *.css ../../../src/libs/;)
fi
