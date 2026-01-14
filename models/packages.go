package models

import "time"

type Package struct {
	ID             uint       `gorm:"column:id_package;primaryKey" json:"id"`
	PackageName    string     `gorm:"column:name_package" json:"name_package"`
	PackageVersion string     `gorm:"column:version_package" json:"version_package"`
	PackageUrl     string     `gorm:"column:url_package" json:"url_package"`
	CreatedAt      time.Time  `gorm:"column:created_at" json:"created_at"`
	RolloutAt      *time.Time `gorm:"column:start_rollout_at" json:"start_rollout_at"`
}

func (Package) TableName() string {
	return "package"
}
