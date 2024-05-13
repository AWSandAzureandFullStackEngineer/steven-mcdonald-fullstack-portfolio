package main

import (
	"backend/config"
	"backend/controller"
	"backend/db"
	"backend/repository"
	"backend/service"
	"log"
	"net/http"

	"github.com/rs/cors"
)

func main() {
	cfg := config.LoadConfig()

	database := db.InitDB(cfg)
	defer database.Close()

	userRepo := repository.NewPostgresUserRepository(database.DB)

	userService := service.NewUserServiceImpl(userRepo)

	userController := controller.NewUserController(userService)

	mux := http.NewServeMux()
	mux.HandleFunc("/register", userController.RegisterUser)

	c := cors.Default().Handler(mux)

	server := &http.Server{
		Addr:    ":" + cfg.Port, 
		Handler: c,             
	}

	log.Printf("Server is listening on port %s", cfg.Port)
	if err := server.ListenAndServe(); err != http.ErrServerClosed {
		log.Fatalf("Failed to start server: %v", err)
	}
}
