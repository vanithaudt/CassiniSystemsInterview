*** Settings ***
|   Library | yahoo |

*** Variables  ***

*** Test Cases ***

|  Test Steps Retreive Market Data Calendar Events |
|    | [Documentation] |  Test Steps Retreive Market Data Calendar Events |
|    | setup driver | driverpath=C:/Users/vanit/Downloads/chromedriver_win32/chromedriver.exe |
|    | login |
|    | goto market data |
|    | ${calenderEvents}= | read from calendar events |
|    | Set Suite Variable | ${calenderEvents} |
|    | log | ${calenderEvents}  |
|    | driver close |

| verify calender events  |
|    | [Documentation] | verify calendar events |
|    | FOR   | ${calEvents}  |     IN    |  @{calenderEvents}  |
|    |    Log  |   ${calEvents}  |
|    |    Should Be True | ${calEvents['economiceventcount']} >= 0 |
|    |    Should Be True | ${calEvents['ipoinfocount']} >= 0 |
|    |    Should Be True | ${calEvents['splitscount']} >= 0 |
|    |    Should Be True | ${calEvents['earningscount']} >= 0 |
|    | END |





