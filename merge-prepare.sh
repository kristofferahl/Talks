# FUNCTIONS
function print-diff {
    echo
    echo DIFF between \'$1\' and \'$2\':
    git diff $1 $2
}

function print-status {
    echo
    echo STATUS:
    git status
}

function print-log {
    echo
    echo LOG:
    git log
}

function print-dirtree {
    echo
    echo DIR:
    find ./*.* -printf "%TY-%Tm-%Td\t%s\t%p\n"
}

function print-head {
    echo
    echo COMMIT:
    git cat-file -p $(git rev-parse HEAD)

    echo
    echo TREE:
    tree=$(git cat-file -p $(git rev-parse HEAD) | grep tree | sed 's/tree //g')
    git cat-file -p $tree
}

# SCRIPT
clear
echo '****************************************************************************'
echo 'SETTING UP A MERGE SCENARIO'
echo '****************************************************************************'

GitTest=./../Talks.Git.Test
rm -rf $GitTest
mkdir $GitTest
cd $GitTest

git init > /dev/null 2>&1
echo Initialized empty repo... On branch \'master\'

echo Adding an empty readme.md
echo '' > ./readme.md
git add -A > /dev/null 2>&1
git commit -m "Added an empty readme" > /dev/null 2>&1
sleep 2

echo Adding content to readme.md
echo '# Gitflow - Bringing order to chaos' > ./readme.md
git add -A > /dev/null 2>&1
git commit -m "Added content to readme" > /dev/null 2>&1
sleep 2

echo Creating foo.sh
echo 'echo This is FOO' > ./foo.sh
git add -A > /dev/null 2>&1
git commit -m "Created foo.sh" > /dev/null 2>&1
sleep 2

echo Creating branch \'feature/abc\'
git checkout -b feature/abc > /dev/null 2>&1

echo Adding more content to the end of foo.sh
echo 'echo This is an addition to FOO made in branch feature/abc' >> ./foo.sh
git add -A > /dev/null 2>&1
git commit -m "Adding more content to foo.sh" > /dev/null 2>&1
sleep 2

echo Checkout master
git checkout master > /dev/null 2>&1

echo '****************************************************************************'
echo 'RESULT'
echo '****************************************************************************'

print-log
print-dirtree
print-status
print-diff master feature/abc