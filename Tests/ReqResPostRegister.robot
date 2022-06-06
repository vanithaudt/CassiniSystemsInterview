*** Settings ***
|   Library | REST        |  https://reqres.in |
|   Library | Collections |

*** Variables  ***

*** Test Cases ***
| Verify register is Successful |
|  | [Documentation] | Post login |
|  | ${jsonGet}= | POST |  api/register    |   { "email":"eve.holt@reqres.in", "password":"pistol" } |
|  | ${status}= | get From Dictionary | ${jsonGet} | status |
|  | Should Be Equal As Strings | ${status} | 200 |
|  | Set Suite Variable | ${jsonGet} |

| Verify login is Successful with any password |
|  | [Documentation] | login is successful |
|  | ${jsonGet}= | POST |  api/register    |   { "email": "eve.holt@reqres.in", "password": "testpassword" } |
|  | ${status}= | get From Dictionary | ${jsonGet} | status |
|  | Should Be Equal As Strings | ${status} | 200 |
|  | Set Suite Variable | ${jsonGet} |

| Verify the token is valid |
|  | [Documentation] | login is successful |
|  | ${body}= | get From Dictionary |  ${jsonGet}  | body |
|  | Should be Equal | ${body['token']} | QpwL5tke4Pnpja7X4 |


