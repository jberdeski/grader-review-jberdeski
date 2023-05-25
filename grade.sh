CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then 
    cp student-submission/ListExamples.java ~/OneDrive/Documents/GitHub/list-examples-grader/grading-area
    cp TestListExamples.java ~/OneDrive/Documents/GitHub/list-examples-grader/grading-area
fi 

gradingArea='grading-area/ListExamples.java'

filterMethod='grep -c static List<String> filter(List<String> s, StringChecker sc) $gradingArea'
mergeMethod='grep -c static List<String> merge(List<String> list1, List<String> list2) $gradingArea'

if [[ $filterMethod == 0 ]] || [[ $mergeMethod == 0 ]]
then
    echo 'Missing method(s)'
else 
    echo 'Methods present'
fi

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" grading-area/ListExamples.java grading-area/TestListExamples.java
java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore ListExamples TestListExamples

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
