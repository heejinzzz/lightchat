# LightChat - FriendManager API List

---

### acceptNewFriend
接受添加联系人申请。

* 请求参数：NewFriendRequest


* 返回参数：acceptNewFriendResponse

|   字段名   |  类型  |   说明   |
|:-------:|:----:|:------:|
| succeed | bool | 是否接受成功 |

---

### changeRemarkName
修改联系人的备注名。

* 请求参数：changeRemarkNameRequest

|      字段名      |   类型   |    说明    |
|:-------------:|:------:|:--------:|
|      id       | string |   用户id   |
|   friendId    | string |  联系人id   |
| newRemarkName | string | 要设置的新备注名 |

* 返回参数：changeRemarkNameResponse

|   字段名    |  类型  |    说明    |
|:--------:|:----:|:--------:|
| isFriend | bool | 该联系人是否有效 |
| succeed  | bool |  是否修改成功  |

---

### checkFriend
检查目标用户是否是自己的联系人。如果是，将给该联系人设置的备注名一同返回。

* 请求参数：checkFriendRequest

|   字段名    |   类型   |   说明   |
|:--------:|:------:|:------:|
|    id    | string |  用户id  |
| targetId | string | 目标用户id |

* 返回参数：checkFriendResponse

|    字段名     |   类型   |              说明               |
|:----------:|:------:|:-----------------------------:|
|  isFriend  |  bool  |            是否是联系人             |
| remarkName | string | 给该联系人设置的备注名（isFriend为true时有效） |

---

### deleteFriend
删除联系人。

* 请求参数：deleteFriendRequest

|   字段名    |   类型   |  说明   |
|:--------:|:------:|:-----:|
|    id    | string | 用户id  |
| friendId | string | 联系人id |

* 返回参数：deleteFriendResponse

|   字段名   |  类型  |   说明   |
|:-------:|:----:|:------:|
| succeed | bool | 是否删除成功 |

---

### getFriends
获取所有联系人的id

* 请求参数：getFriendsRequest

| 字段名 |   类型   |  说明  |
|:---:|:------:|:----:|
| id  | string | 用户id |

* 返回参数：getFriendsResponse

| 字段名 |    类型    |    说明    |
|:---:|:--------:|:--------:|
| ids | string[] | 所有联系人的id |

---

### getNewFriendRequests
获取所有与自己有关的添加联系人申请，包括发送的和收到的。

* 请求参数：getNewFriendRequestsRequest

| 字段名 |   类型   |  说明  |
|:---:|:------:|:----:|
| id  | string | 用户类别 |

* 返回参数：getNewFriendRequestsResponse

|   字段名    |         类型          |       说明        |
|:--------:|:-------------------:|:---------------:|
| requests | NewFriendRequests[] | 与自己有关的所有添加联系人申请 |

---

### rejectNewFriend
拒绝添加联系人申请。

* 请求参数：NewFriendRequest


* 返回参数：rejectNewFriendResponse

|   字段名   |  类型  |   说明   |
|:-------:|:----:|:------:|
| succeed | bool | 是否拒绝成功 |


---

### sendNewFriendRequest
发送添加联系人申请。

* 请求参数：NewFriendRequest


* 返回参数：sendNewFriendRequestResponse

|   字段名   |  类型  |   说明   |
|:-------:|:----:|:------:|
| succeed | bool | 是否发送成功 |
