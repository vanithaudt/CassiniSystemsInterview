*** Settings ***
|   Library | REST        |  https://reqres.in |
|   Library | Collections |
|   Library | DateTime |
|   Library | String |

*** Variables  ***

*** Test Cases ***
| Verify PUT Update  is Successful |
|  | [Documentation] | PUT Update   |
|  | ${jsonGet}= | PUT |  api/users/2    |   { "name":"morpheus", "job":"zion resident" } |
|  | ${status}= | get From Dictionary | ${jsonGet} | status |
|  | Should Be Equal As Strings | ${status} | 200 |
|  | Set Suite Variable | ${jsonGet} |

| Verify the name, job, update are valid |
|  | [Documentation] | put operation is successful |
|  | ${body}= | get From Dictionary |  ${jsonGet}  | body |
|  | Should Be Equal | ${body['name']} |  morpheus |
|  | Should Be Equal | ${body['job']} |  zion resident |
|  | ${date}= | Get Current Date | result_format=%Y-%m-%d |
|  | ${returneddate} = | Convert Date	| ${body['updatedAt']} | result_format=%Y-%m-%d |
|  | Should Be Equal | ${date} | ${returneddate} |

| Verify PUT Update  is Successful for anothe user  |
|  | [Documentation] | PUT Update   |
|  | ${jsonGet}= | PUT |  api/users    |   { "name":"vanitha", "job":"tester" } |
|  | ${status}= | get From Dictionary | ${jsonGet} | status |
|  | Should Be Equal As Strings | ${status} | 200 |
|  | Set Suite Variable | ${jsonGet} |

| Verify the token, name, password, id are valid for 2nd user |
|  | [Documentation] | PUT operation is successful |
|  | ${body}= | get From Dictionary |  ${jsonGet}  | body |
|  | Should Be Equal | ${body['name']} |  vanitha |
|  | Should Be Equal | ${body['job']} |  tester |
|  | ${date}= | Get Current Date | result_format=%Y-%m-%d |
|  | ${returneddate} = | Convert Date	| ${body['updatedAt']} | result_format=%Y-%m-%d |
|  | Should Be Equal | ${date} | ${returneddate} |


| Verify PUT Update  is Successful for random user  |
|  | [Documentation] | PUT Update   |
|  | ${jsonGet}= | PUT |  api/users    |   { "name":"abcddfasdf", "job":"tester" } |
|  | ${status}= | get From Dictionary | ${jsonGet} | status |
|  | Should Be Equal As Strings | ${status} | 200 |
|  | Set Suite Variable | ${jsonGet} |

| Verify the token, name, password, id are valid for random user |
|  | [Documentation] | PUT operation is successful |
|  | ${body}= | get From Dictionary |  ${jsonGet}  | body |
|  | Should Be Equal | ${body['name']} |  abcddfasdf |
|  | Should Be Equal | ${body['job']} |  tester |
|  | ${date}= | Get Current Date | result_format=%Y-%m-%d |
|  | ${returneddate} = | Convert Date	| ${body['updatedAt']} | result_format=%Y-%m-%d |
|  | Should Be Equal | ${date} | ${returneddate} |

