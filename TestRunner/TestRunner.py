import os
from configparser import *
import robot
import sys

class fileParse:

    def __init__(self,fileName):
        self.config = ConfigParser(allow_no_value=True)
        self.config.read(fileName)

    def get_tests(self):
        """
        get test names form the ini file
        :return: test list
        """
        tests = self.config.items('TestSuits')
        testlist = []
        for test in tests: testlist.append(test[0])
        return testlist

    def get_variables(self):
        """
        get variables
        :return: variables list
        """
        variables = self.config.items('Variables')
        return variables

    def get_variable_value(self, variable):
        """
        get variable value
        :return: variable value
        """
        return self.config.get('Variables', variable)


class runTests:

    def __init__(self, runlist):
        """
        init method setups the object with test list
        :param runlist:
        """
        self.runlist = runlist

    def runRobotTests(self, runPath, pypath="C:\\Users\\vanit\\PycharmProjects\\CassiniSystemsInterview"):
        """
        Run Robot tests
        :param runPath: Test runs from path
        :return: N/A
        """
        print("Running Tests From Path : ", runPath)
        os.chdir(runPath)
        for test in self.runlist:
            robot.run(
                "Tests/" + test + ".robot",
                pythonpath=pypath,
                log=test + "-Log.html",
                output=test + "-output.xml",
                report=test + "-TestReport.html",
                outputdir="TestResults",
                loglevel="INFO"
            )

if __name__ == '__main__':
    f = fileParse(sys.argv[1]) #file name
    run = runTests(f.get_tests())
    run.runRobotTests(f.get_variable_value('RunFrom'), f.get_variable_value('PythonPath'))
