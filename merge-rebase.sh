GitTest=./../Talks.Git.Test
cd $GitTest

echo Adding bar.sh to master
echo 'echo This is BAR' >> ./bar.sh
git add -A > /dev/null 2>&1
git commit -m "Adding bar.sh" > /dev/null 2>&1
sleep 2

echo
echo DIFF:
echo

git diff feature/abc

echo
read -p "Press any key to continue... " -n1 -s

echo
echo Checkout feature/abc

git checkout feature/abc

echo
echo Rebasing feature/abc ontop of master
echo Command:
echo git rebase master
echo

git rebase master

echo
echo DIFF:
echo

git diff master

echo
read -p "Press any key to continue... " -n1 -s

echo
echo Checkout master

git checkout master

echo
echo Merging feature/abc
echo Command:
echo git merge feature/abc --no-ff
echo

git merge feature/abc --no-ff