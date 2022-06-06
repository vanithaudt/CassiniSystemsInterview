*** Settings ***
|   Library | yahoo |

*** Variables  ***

*** Test Cases ***

|  Get Login Credntials from Excel  |
|    | [Documentation] |  Get login credentials from excel |
|    | ${credentials}= | get excel credentials |
|    | Set Suite Variable | ${credentials} |

|  Login with excel credentials login |
|    | [Documentation] |  Test Steps to run logins |
|    | setup driver | driverpath=C:/Users/vanit/Downloads/chromedriver_win32/chromedriver.exe |
|    | login | ${credentials}[0] |
|    | goto market data |
|    | ${calenderEvents}= | read from calendar events |
|    | Set Suite Variable | ${calenderEvents} |
|    | log | ${calenderEvents}  |
|    | driver close |

|  Verify Unsuccessful login with excel credentials set 1 |
|    | [Documentation] |  Test Steps to run logins |
|    | setup driver | driverpath=C:/Users/vanit/Downloads/chromedriver_win32/chromedriver.exe |
|    | log | ${credentials}[1] |
|    | ${login}= | invalid login | ${credentials}[1] |
|    | Should Be Equal | ${login} | login unsuccessful |
|    | driver close |

|  Verify Unsuccessful login with excel credentials set 2 |
|    | [Documentation] |  Test Steps to run logins |
|    | setup driver | driverpath=C:/Users/vanit/Downloads/chromedriver_win32/chromedriver.exe |
|    | log | ${credentials}[1] |
|    | ${login}= | invalid login | ${credentials}[2] |
|    | Should Be Equal | ${login} | login unsuccessful |
|    | driver close |