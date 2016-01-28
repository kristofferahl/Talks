GitTest=./../Talks.Git.Test
cd $GitTest

echo
echo DIFF:
echo

git diff feature/abc

echo
read -p "Press any key to continue... " -n1 -s

echo
echo Adding conflicting content to the end of foo.sh
echo 'echo This is an addition to FOO made in branch master' >> ./foo.sh
git add -A > /dev/null 2>&1
git commit -m "Adding more content to foo.sh" > /dev/null 2>&1
sleep 2

echo
echo DIFF:
echo

git diff feature/abc

echo
read -p "Press any key to continue... " -n1 -s

echo
echo Merging feature/abc
echo Command:
echo git merge feature/abc
echo

git merge feature/abc