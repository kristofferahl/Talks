GitTest=./../Talks.Git.Test
cd $GitTest

echo Adding bar.sh
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
echo Merging feature/abc
echo Command:
echo git merge feature/abc
echo

git merge feature/abc