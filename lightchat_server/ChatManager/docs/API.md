# LightChat - ChatManager API List

---

## 1. MessageManager API List

---

### createSession
在添加联系人时调用此函数，用于创建一个新的聊天会话。

* 请求参数：CreateSessionRequest

|    字段名    |   类型   |  说明  |
|:---------:|:------:|:----:|
| sessionId | string | 会话id |
|  userId   | string | 用户id |

* 返回参数：CreateSessionResponse

|   字段名   |  类型  |   说明   |
|:-------:|:----:|:------:|
| succeed | bool | 是否创建成功 |

---

### getMessages
获取聊天消息。

* 请求参数：GetMessagesRequest

|       字段名       |       类型       |                            说明                            |
|:---------------:|:--------------:|:--------------------------------------------------------:|
|    sessionId    |     string     |                          聊天会话id                          |
|      type       | GetRequestType |        请求类型，为`CHAT`时表示请求聊天消息，为`HISTORY`时表示请求聊天记录         |
| targetMessageId |     string     |           所要查找的目标消息的id，当`type`字段为`HISTORY`时有效            |
|   isStartPage   |      bool      |             是否请求最新的聊天消息，当`type`字段为`CHAT`时有效              |
|  lastMessageId  |     string     | 之前获得的最后一条消息的id，当`type`字段为`CHAT`且`isStartPage`为`false`时有效 |

* 返回参数：GetMessagesResponse

|    字段名     |      类型       |        说明        |
|:----------:|:-------------:|:----------------:|
|  messages  | MessageTile[] |      返回的消息       |
| isLastPage |     bool      | 是否已返回完该聊天会话的所有消息 |

---

### getSessionList
获取聊天会话列表。

* 请求参数：GetSessionListRequest

|  字段名   |   类型   |  说明  |
|:------:|:------:|:----:|
| userId | string | 用户id |

* 返回参数：GetSessionListResponse

|   字段名    |      类型       |      说明       |
|:--------:|:-------------:|:-------------:|
| messages | MessageTile[] | 每个聊天会话的最近一条消息 |

---

### search
根据关键词查找聊天记录。

* 请求参数：SearchRequest

|   字段名   |   类型   |   说明    |
|:-------:|:------:|:-------:|
| userId  | string |  用户id   |
| keyword | string | 要查找的关键词 |

* 返回参数：SearchResponse

|   字段名    |      类型       |     说明     |
|:--------:|:-------------:|:----------:|
| messages | MessageTile[] | 查找到的所有匹配消息 |

---

### sendMessage
发送一条消息。

* 请求参数：MessageTile

* 返回参数：SendMessageResponse

|    字段名    |   类型   |    说明    |
|:---------:|:------:|:--------:|
| messageId | string | 返回该消息的id |

---

## 2. ChatStream API List

ChatStream 只对外提供一个接口，用于实现即时通讯。

客户端请求连接 ChatStream 并声明用户身份后，ChatStream 将维持二者的 websocket 连接。ChatStream 一旦收到以该用户为接收方的消息，就立即将此消息转发给该客户端，从而实现无延时的实时在线聊天。

* 请求参数：

|   类型   |       说明       |
|:------:|:--------------:|
| string | 客户端用于声明身份的用户id |

* 返回参数：

|     类型      |      说明       |
|:-----------:|:-------------:|
| MessageTile | 以该用户为接收方的在线消息 |

