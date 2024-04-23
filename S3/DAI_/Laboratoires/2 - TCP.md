---
Note: 
Chapitre: 2 - TCP
DateDeRetour: 2023-11-28
---
## Server
Start the server : `start -i <ip> -p <port>`

## Client
#### Connection
Command: `connect -i <ip> -p <port>`

|Response|Detail|
| ---- | ---- |
|`Connected`|The client is connected!|
|`Nothing on this IP or port`|No server is available on this IP or port.|
|`Too much players`|There is too much people on the server.|
#### Register username
Command: `username <username>`

|Response|Detail|
| ---- | ---- |
|`Nice username`|The username as been added.|
|`Too long`|The username is too long sorry.|
#### Start game
Command: `start`

|Response|Detail|
| ---- | ---- |
|`Let's gooo!`|The game start!|
|`Wait a lil bit.`|The other player is not ready yet.|
|`Forget username?`|You need to have a username.|

#### Place boat (actually random)

#### Attack sheep
Command: `Shoot <position -> B1>`

|Response|Detail|
| ---- | ---- |
|`Nice shot!`|You touched a sheep.|
|`Plouf`|You missed the shot.|
|`Sink!`|You sink a boat.|

#### Finish game
Command: `Ciaoo`

|Response|Detail|
| ---- | ---- |
|`Bye`|You ended the game.|

Command : `Again`

|Response|Detail|
| ---- | ---- |
|`Challenge accepted`|Your oppenent accepted the challenge.|
|`Oppenent deserted!`|Your oppenent deserted.|
