*** Settings ***
|   Library | REST        |  https://reqres.in |
|   Library | Collections |

*** Variables  ***

*** Test Cases ***

| Verify register is unsuccesfull when supplied wrong emailid |
|  | [Documentation] | Post login |
|  | ${jsonGet}= | POST |  api/register    |   { "email": "wrong.email@reqres.in", "password": "wrongpassword" } |
|  | ${status}= | get From Dictionary | ${jsonGet} | status |
|  | Should Be Equal As Strings | ${status} | 400 |
|  | Set Suite Variable | ${jsonGet} |

| Verify returned error message as invalid user  |
|  | [Documentation] | check that user information being returened are greater than zero |
|  | ${body}= | get From Dictionary |  ${jsonGet}   | body |
|  | Should Be Equal | ${body['error']} | Note: Only defined users succeed registration |

| Verify register is unsuccesfull when supplied no password |
|  | [Documentation] | Post login |
|  | ${jsonGet}= | POST |  api/register    |   { "email": "wrong.email@reqres.in"  } |
|  | ${status}= | get From Dictionary | ${jsonGet} | status |
|  | Should Be Equal As Strings | ${status} | 400 |
|  | Set Suite Variable | ${jsonGet} |

| Verify returned error message as Missing Password  |
|  | [Documentation] | check that user information being returened are greater than zero |
|  | ${body}= | get From Dictionary |  ${jsonGet}   | body |
|  | Should Be Equal | ${body['error']} | Missing password |

