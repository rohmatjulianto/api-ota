package routes

import (
	"MyApp/MyApp/controllers"

	"github.com/gin-gonic/gin"
)

func SetupDeviceRoutes(r *gin.Engine) {
	api := r.Group("/api")
	{
		api.GET("/devices", controllers.GetDevices)
		api.POST("/devices", controllers.CreateDevice)
	}
}
