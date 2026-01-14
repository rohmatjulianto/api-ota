package models

import "time"

type Device struct {
	SN             string    `gorm:"column:sn_devices;primaryKey" json:"serial_number"`
	CurrentPackage string    `gorm:"column:current_package" json:"current_package"`
	NewestPackage  string    `gorm:"column:newest_update" json:"newest_package"`
	RegisteredAt   time.Time `gorm:"column:registered_device_at" json:"registered_at"`
	CheckDeviceAt  time.Time `gorm:"column:check_device_at" json:"checked_at"`
}

func (Device) TableName() string {
	return "devices"
}
