GitTest=./../Talks.Git.Test
cd $GitTest

echo
echo DIFF:
echo

git diff feature/abc

echo
read -p "Press any key to continue... " -n1 -s

echo
echo Merging feature/abc
echo Command:
echo git merge feature/abc --no-ff
echo

git merge feature/abc --no-ff