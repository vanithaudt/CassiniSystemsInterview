*** Settings ***
|   Library | REST        |  https://reqres.in |
|   Library | Collections |

*** Variables  ***

*** Test Cases ***

| Verify login is unsuccesfull when supplied wrong emailid |
|  | [Documentation] | Post login |
|  | ${jsonGet}= | POST |  api/login    |   { "email": "wrong.email@reqres.in", "password": "wrongpassword" } |
|  | ${status}= | get From Dictionary | ${jsonGet} | status |
|  | Should Be Equal As Strings | ${status} | 400 |
|  | Set Suite Variable | ${jsonGet} |

| Verify returned error message as invalid user  |
|  | [Documentation] | check that user information being returened are greater than zero |
|  | ${body}= | get From Dictionary |  ${jsonGet}   | body |
|  | Should Be Equal | ${body['error']} | user not found |

| Verify login is unsuccesfull when supplied no password |
|  | [Documentation] | Post login |
|  | ${jsonGet}= | POST |  api/login    |   { "email": "wrong.email@reqres.in"  } |
|  | ${status}= | get From Dictionary | ${jsonGet} | status |
|  | Should Be Equal As Strings | ${status} | 400 |
|  | Set Suite Variable | ${jsonGet} |

| Verify returned error message as Missing Password  |
|  | [Documentation] | check that user information being returened are greater than zero |
|  | ${body}= | get From Dictionary |  ${jsonGet}   | body |
|  | Should Be Equal | ${body['error']} | Missing password |

