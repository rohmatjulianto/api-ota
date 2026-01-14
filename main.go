package main

import (
	"MyApp/MyApp/config"
	"MyApp/MyApp/routes"
	"log"
	"os"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
)

func main() {

	r := gin.Default()

	// CORS middleware
	r.Use(cors.Default())

	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	// Create the upload directory if it doesn't exist
	os.MkdirAll(os.Getenv("UPLOAD_DIRECTORY"), 0755)

	config.ConnectDatabase()
	routes.SetupUserRoutes(r)
	routes.SetupPackageRoutes(r)
	routes.SetupDeviceRoutes(r)

	r.Run(":8081") // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
