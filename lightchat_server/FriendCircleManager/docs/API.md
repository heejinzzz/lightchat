# LightChat - FriendCircleManager API List

---

### delete
删除一条朋友圈。

* 请求参数：DeleteRequest

|      字段名       |   类型   |    说明     |
|:--------------:|:------:|:---------:|
|     userId     | string |   用户id    |
| friendCircleId | int64  | 要删除的朋友圈id |

* 返回参数：DeleteResponse

|   字段名   |  类型  |   说明   |
|:-------:|:----:|:------:|
| succeed | bool | 是否删除成功 |

---

### getDetail
获取一条朋友圈的内容详情。

* 请求参数：GetDetailRequest

| 字段名 |  类型   |  说明   |
|:---:|:-----:|:-----:|
| id  | int64 | 朋友圈id |

* 返回参数：FriendCircle

---

### getFriendCircles
获取单独一个用户的所有朋友圈的id，或者自己和所有联系人的朋友圈的id。

* 请求参数：GetFriendCirclesRequest

|    字段名    |   类型   |                         说明                         |
|:---------:|:------:|:--------------------------------------------------:|
| broadcast |  bool  | broadcast为false时只查询单独一个用户的朋友圈，为true时查询自己和所有联系人的朋友圈 |
|  userId   | string |                        用户id                        |

* 返回参数：GetFriendCirclesResponse

| 字段名 |   类型    |      说明      |
|:---:|:-------:|:------------:|
| ids | int64[] | 要查询的所有朋友圈的id |

---

### publish
发布一条朋友圈。

* 请求参数：FriendCircle


* 返回参数：PublishResponse

|   字段名   |  类型   |     说明     |
|:-------:|:-----:|:----------:|
| succeed | bool  |   是否发布成功   |
|   id    | int64 | 返回这条朋友圈的id |

---

### sendComment
对一条朋友圈发表评论或回复其他用户的评论。

* 请求参数：SendCommentRequest

|      字段名       |   类型    |    说明     |
|:--------------:|:-------:|:---------:|
| friendCircleId |  int64  | 要评论的朋友圈id |
|    comment     | Comment |   评论或回复   |

* 返回参数：SendCommentResponse

|   字段名   |  类型  |     说明      |
|:-------:|:----:|:-----------:|
| succeed | bool | 评论或回复是否发送成功 |

---

### thumb
点赞或取消点赞一条朋友圈。

* 请求参数：ThumbRequest

|      字段名       |    类型     |       说明        |
|:--------------:|:---------:|:---------------:|
|     userId     |  string   |      用户id       |
| friendCircleId |   int64   |      朋友圈id      |
|      type      | ThumbType | 指定本次操作是点赞还是取消点赞 |

* 返回参数：ThumbResponse

|   字段名   |  类型  |   说明   |
|:-------:|:----:|:------:|
| succeed | bool | 操作是否成功 |
