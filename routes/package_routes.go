package routes

import (
	"MyApp/MyApp/controllers"

	"github.com/gin-gonic/gin"
)

func SetupPackageRoutes(r *gin.Engine) {

	api := r.Group("/api")
	{
		api.GET("/packages", controllers.GetPackages)
		api.POST("/packages/upload", controllers.CreatePackage)
		api.GET("/packages/latest", controllers.GetPackagesLatest)
	}
}
