#!/bin/bash

echo "Running tests in $(pwd)..."
cd src/cat
chmod +x tests_cat.sh
RESULT=$(bash ./tests_cat.sh  | grep "FAIL: 0")
if [ -z "$RESULT" ]; then
    echo 'Integration tests failed.'
    exit 1
fi


cd ../grep
chmod +x tests_grep.sh
RESULT=$(bash ./tests_grep.sh| grep "FAIL: 0")
if [ -z "$RESULT" ]; then
    echo 'Integration tests failed.'
    exit 1
fi
cd ..


echo 'Integration tests are successful.'
exit 0
