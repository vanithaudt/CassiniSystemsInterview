*** Settings ***
|   Library | REST        |  https://reqres.in |
|   Library | Collections |

*** Variables  ***

*** Test Cases ***

| Verify request response is Successful |
|  | [Documentation] | Get method connects to the URL and receives a response in json and parsed to check  http response of 200 |
|  | ${jsonGet}= | GET |  api/unknown     |
|  | ${status}= | get From Dictionary | ${jsonGet} | status |
|  | Should Be Equal As Strings | ${status} | 200 |
|  | Set Suite Variable | ${jsonGet} |

| Verify returned json has list of users |
|  | [Documentation] | check that user information being returened are greater than zero |
|  | ${body}= | get From Dictionary |  ${jsonGet}  | body |
|  | ${data}= | get From Dictionary |  ${body}  | data |
|  | ${counter}= | Get Length | ${data} |
|  | Set Suite Variable | ${data} |
|  | Should Be True | ${counter} > 0 |

| Verify the user name blue turquoise |
|  | [Documentation] | Compare the dictionary object |
|  | Should Be Equal As Integers | ${data[5]['id']}  | 6 |
|  | Should Be Equal | ${data[5]['name']}  | blue turquoise |
|  | Should Be Equal As Integers | ${data[5]['year']}  | 2005 |
|  | Should Be Equal | ${data[5]['color']} | \#53B0AE |
|  | Should Be Equal | ${data[5]['pantone_value']} | 15-5217 |

| Verify the user name tigerlily |
|  | [Documentation] | Compare the dictionary object |
|  | Should Be Equal As Integers | ${data[4]['id']}  | 5 |
|  | Should Be Equal | ${data[4]['name']}  | tigerlily |
|  | Should Be Equal As Integers | ${data[4]['year']}  | 2004 |
|  | Should Be Equal | ${data[4]['color']} | \#E2583E |
|  | Should Be Equal | ${data[4]['pantone_value']} | 17-1456 |

*** Keywords ***