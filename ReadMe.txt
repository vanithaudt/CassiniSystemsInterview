Read
====

1. Install the necessary python libraries mentioned in setup.txt

2. Run the test as " py TestRunner.py TestRunner.ini "

3. Tests -
    1. SeleniumYahooCalenderEvents.robot - covers the exercise 2 and JSON file  formatting
       1. SeleniumYahooLoginWithExcelCredentials - read from excel credentials and pass it in the tests
    2. ReqRes tests are REST API testing with ROBOT framework with Robot Instance library
        1. ReqResDelete for DELETE operation
        2. ReqResGetLit for GET operation
        3. ReqResPostRegister*.robot and ReqResLogin*.robot are POST operation
        4. ReqResPatch*.robot tests for PATCH operation

4. TestResults - Test Results are captured in folder "TestResults"

5. Test Output looks like below

Test Run and Output looks as below:
===================================

C:\Python310\python.exe C:/Users/vanit/PycharmProjects/CassiniSystemsInterview/TestRunner/TestRunner.py C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestRunner\TestRunner.ini
Running Tests From Path :  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview
==============================================================================
Seleniumyahoocalenderevents
==============================================================================
setup driver :: setup driver                                          | PASS |
------------------------------------------------------------------------------
verify calender events :: verify calendar events                      | PASS |
------------------------------------------------------------------------------
Seleniumyahoocalenderevents                                           | PASS |
2 tests, 2 passed, 0 failed
==============================================================================
Output:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\seleniumyahoocalenderevents-output.xml
Log:     C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\seleniumyahoocalenderevents-Log.html
Report:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\seleniumyahoocalenderevents-TestReport.html
==============================================================================
Reqresgetlist
==============================================================================
Verify request response is Successful :: Get method connects to th... | PASS |
------------------------------------------------------------------------------
Verify returned json has list of users :: check that user informat... | PASS |
------------------------------------------------------------------------------
Verify the user name blue turquoise :: Compare the dictionary object  | PASS |
------------------------------------------------------------------------------
Verify the user name tigerlily :: Compare the dictionary object       | PASS |
------------------------------------------------------------------------------
Reqresgetlist                                                         | PASS |
4 tests, 4 passed, 0 failed
==============================================================================
Output:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqresgetlist-output.xml
Log:     C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqresgetlist-Log.html
Report:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqresgetlist-TestReport.html
==============================================================================
Reqrespostloginsuccessful
==============================================================================
Verify login is Successful :: Post login                              | PASS |
------------------------------------------------------------------------------
Verify login is Successful with any password :: login is successful   | PASS |
------------------------------------------------------------------------------
Verify the token is valid :: login is successful                      | PASS |
------------------------------------------------------------------------------
Reqrespostloginsuccessful                                             | PASS |
3 tests, 3 passed, 0 failed
==============================================================================
Output:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqrespostloginsuccessful-output.xml
Log:     C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqrespostloginsuccessful-Log.html
Report:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqrespostloginsuccessful-TestReport.html
==============================================================================
Reqresloginunsuccessful
==============================================================================
Verify login is unsuccesfull when supplied wrong emailid :: Post l... | PASS |
------------------------------------------------------------------------------
Verify returned error message as invalid user :: check that user i... | PASS |
------------------------------------------------------------------------------
Verify login is unsuccesfull when supplied no password :: Post login  | PASS |
------------------------------------------------------------------------------
Verify returned error message as Missing Password :: check that us... | PASS |
------------------------------------------------------------------------------
Reqresloginunsuccessful                                               | PASS |
4 tests, 4 passed, 0 failed
==============================================================================
Output:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqresloginunsuccessful-output.xml
Log:     C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqresloginunsuccessful-Log.html
Report:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqresloginunsuccessful-TestReport.html
==============================================================================
Reqrespostregister
==============================================================================
Verify register is Successful :: Post login                           | PASS |
------------------------------------------------------------------------------
Verify login is Successful with any password :: login is successful   | PASS |
------------------------------------------------------------------------------
Verify the token is valid :: login is successful                      | PASS |
------------------------------------------------------------------------------
Reqrespostregister                                                    | PASS |
3 tests, 3 passed, 0 failed
==============================================================================
Output:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqrespostregister-output.xml
Log:     C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqrespostregister-Log.html
Report:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqrespostregister-TestReport.html
==============================================================================
Reqrespostregisterunsuccessful
==============================================================================
Verify register is unsuccesfull when supplied wrong emailid :: Pos... | PASS |
------------------------------------------------------------------------------
Verify returned error message as invalid user :: check that user i... | PASS |
------------------------------------------------------------------------------
Verify register is unsuccesfull when supplied no password :: Post ... | PASS |
------------------------------------------------------------------------------
Verify returned error message as Missing Password :: check that us... | PASS |
------------------------------------------------------------------------------
Reqrespostregisterunsuccessful                                        | PASS |
4 tests, 4 passed, 0 failed
==============================================================================
Output:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqrespostregisterunsuccessful-output.xml
Log:     C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqrespostregisterunsuccessful-Log.html
Report:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqrespostregisterunsuccessful-TestReport.html
==============================================================================
Reqrespostcreate
==============================================================================
Verify Post Create is Successful :: Post Create                       | PASS |
------------------------------------------------------------------------------
Verify the token, name, password, id are valid :: create operation... | PASS |
------------------------------------------------------------------------------
Verify Post Create is Successful for anothe user :: Post Create       | PASS |
------------------------------------------------------------------------------
Verify the token, name, password, id are valid for 2nd user :: cre... | PASS |
------------------------------------------------------------------------------
Reqrespostcreate                                                      | PASS |
4 tests, 4 passed, 0 failed
==============================================================================
Output:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqrespostcreate-output.xml
Log:     C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqrespostcreate-Log.html
Report:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqrespostcreate-TestReport.html
==============================================================================
Reqrespatchsuccessful
==============================================================================
Verify Patch Update  is Successful :: Patch Update                    | PASS |
------------------------------------------------------------------------------
Verify the name, job, update are valid :: create operation is succ... | PASS |
------------------------------------------------------------------------------
Verify Patch Update  is Successful for anothe user :: Patch Update    | PASS |
------------------------------------------------------------------------------
Verify the token, name, password, id are valid for 2nd user :: cre... | PASS |
------------------------------------------------------------------------------
Verify Patch Update  is Successful for anothe user random user :: ... | PASS |
------------------------------------------------------------------------------
Verify the token, name, password, id are valid for random user :: ... | PASS |
------------------------------------------------------------------------------
Reqrespatchsuccessful                                                 | PASS |
6 tests, 6 passed, 0 failed
==============================================================================
Output:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqrespatchsuccessful-output.xml
Log:     C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqrespatchsuccessful-Log.html
Report:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqrespatchsuccessful-TestReport.html
==============================================================================
Reqresputupdate
==============================================================================
Verify PUT Update  is Successful :: PUT Update                        | PASS |
------------------------------------------------------------------------------
Verify the name, job, update are valid :: put operation is successful | PASS |
------------------------------------------------------------------------------
Verify PUT Update  is Successful for anothe user :: PUT Update        | PASS |
------------------------------------------------------------------------------
Verify the token, name, password, id are valid for 2nd user :: PUT... | PASS |
------------------------------------------------------------------------------
Verify PUT Update  is Successful for random user :: PUT Update        | PASS |
------------------------------------------------------------------------------
Verify the token, name, password, id are valid for random user :: ... | PASS |
------------------------------------------------------------------------------
Reqresputupdate                                                       | PASS |
6 tests, 6 passed, 0 failed
==============================================================================
Output:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqresputupdate-output.xml
Log:     C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqresputupdate-Log.html
Report:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqresputupdate-TestReport.html
==============================================================================
Reqresdelete
==============================================================================
Verify PUT Update  is Successful :: DELETE Update                     | PASS |
------------------------------------------------------------------------------
Reqresdelete                                                          | PASS |
1 test, 1 passed, 0 failed
==============================================================================
Output:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqresdelete-output.xml
Log:     C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqresdelete-Log.html
Report:  C:\Users\vanit\PycharmProjects\CassiniSystemsInterview\TestResults\reqresdelete-TestReport.html

Process finished with exit code 0


