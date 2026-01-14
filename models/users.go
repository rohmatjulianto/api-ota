package models

type User struct {
	ID        uint   `gorm:"column:id_users;primaryKey" json:"id"`
	Email     string `gorm:"column:email" json:"email" binding:"required,email"`
	Username  string `gorm:"column:username" json:"username" binding:"required"`
	Password  string `gorm:"column:password" json:"password" binding:"required"`
	Timestamp string `gorm:"column:timestamp" json:"createdAt"`
}

func (User) TableName() string {
	return "users"
}
