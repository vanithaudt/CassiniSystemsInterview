*** Settings ***
|   Library | REST        |  https://reqres.in |
|   Library | Collections |
|   Library | DateTime |
|   Library | String |

*** Variables  ***

*** Test Cases ***
| Verify Post Create is Successful |
|  | [Documentation] | Post Create  |
|  | ${jsonGet}= | POST |  api/users    |   { "name":"morpheus", "password":"leader" } |
|  | ${status}= | get From Dictionary | ${jsonGet} | status |
|  | Should Be Equal As Strings | ${status} | 201 |
|  | Set Suite Variable | ${jsonGet} |

| Verify the token, name, password, id are valid |
|  | [Documentation] | create operation is successful |
|  | ${body}= | get From Dictionary |  ${jsonGet}  | body |
|  | Should Be Equal | ${body['name']} |  morpheus |
|  | Should Be Equal | ${body['password']} |  leader |
|  | Evaluate |  ${body['id']}  > 0  |
|  | ${date}= | Get Current Date | result_format=%Y-%m-%d |
|  | ${returneddate} = | Convert Date	| ${body['createdAt']} | result_format=%Y-%m-%d |
|  | Should Be Equal | ${date} | ${returneddate} |


| Verify Post Create is Successful for anothe user  |
|  | [Documentation] | Post Create  |
|  | ${jsonGet}= | POST |  api/users    |   { "name":"vanitha", "password":"leader" } |
|  | ${status}= | get From Dictionary | ${jsonGet} | status |
|  | Should Be Equal As Strings | ${status} | 201 |
|  | Set Suite Variable | ${jsonGet} |

| Verify the token, name, password, id are valid for 2nd user |
|  | [Documentation] | create operation is successful |
|  | ${body}= | get From Dictionary |  ${jsonGet}  | body |
|  | Should Be Equal | ${body['name']} |  vanitha |
|  | Should Be Equal | ${body['password']} |  leader |
|  | Evaluate |  ${body['id']}  > 0  |
|  | ${date}= | Get Current Date | result_format=%Y-%m-%d |
|  | ${returneddate} = | Convert Date	| ${body['createdAt']} | result_format=%Y-%m-%d |
|  | Should Be Equal | ${date} | ${returneddate} |
