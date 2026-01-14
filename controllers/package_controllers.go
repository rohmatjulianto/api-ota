package controllers

import (
	"MyApp/MyApp/config"
	"MyApp/MyApp/models"
	"fmt"
	"log"
	"net/http"
	"os"
	"path/filepath"
	"strings"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
)

func GetPackages(c *gin.Context) {
	var packages []models.Package
	if err := config.DB.Order("created_at DESC").Find(&packages).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, packages)
}

func CreatePackage(c *gin.Context) {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	dir := os.Getenv("UPLOAD_DIRECTORY")
	os.MkdirAll(dir, 0755)

	file, err := c.FormFile("file")
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	dst := filepath.Join(dir, filepath.Base(file.Filename))
	if err := c.SaveUploadedFile(file, dst); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	filename := file.Filename
	downloadURL := fmt.Sprintf("/assets/%s", filename)

	versionName := strings.TrimSuffix(filepath.Base(filename), filepath.Ext(filename))
	start := strings.LastIndex(filename, "(")
	end := strings.LastIndex(filename, ")")
	pkgVersion := filename[start+1 : end]

	pkg := models.Package{
		PackageName:    versionName,
		PackageVersion: pkgVersion,
		PackageUrl:     downloadURL,
		CreatedAt:      time.Now(),
		RolloutAt:      nil,
	}

	if err := config.DB.Create(&pkg).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, pkg)
}

func DeletePackage(c *gin.Context) {
	id := c.Param("id")
	if err := config.DB.Delete(&models.Package{}, id).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "Package deleted successfully"})
}

func GetPackagesByVersionName(c *gin.Context) {
	versionName := c.Param("versionName")
	var packages []models.Package
	if err := config.DB.Where("version_package = ?", versionName).Find(&packages).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, packages)
}

func GetPackagesLatest(c *gin.Context) {
	packages, err := getPackagesLatest()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, packages)
}

func getPackagesLatest() ([]models.Package, error) {
	var packages []models.Package
	if err := config.DB.Order("created_at DESC").Limit(1).Find(&packages).Error; err != nil {
		return nil, err
	}
	return packages, nil
}
