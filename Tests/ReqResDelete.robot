*** Settings ***
|   Library | REST        |  https://reqres.in |
|   Library | Collections |
|   Library | DateTime |
|   Library | String |

*** Variables  ***

*** Test Cases ***
| Verify PUT Update  is Successful |
|  | [Documentation] | DELETE Update   |
|  | ${jsonGet}= | DELETE |  api/users/2    |
|  | log | ${jsonGet} |
|  | ${status}= | get From Dictionary | ${jsonGet} | status |
|  | Should Be Equal As Strings | ${status} | 204 |
|  | Set Suite Variable | ${jsonGet} |
