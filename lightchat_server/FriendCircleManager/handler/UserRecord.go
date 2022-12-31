package handler

type UserRecord struct {
	Id            string  `bson:"id"`
	FriendCircles []int64 `bson:"friendCircles"`
}
