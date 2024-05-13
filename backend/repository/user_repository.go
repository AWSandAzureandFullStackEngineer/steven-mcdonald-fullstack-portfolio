package repository

import (
	"backend/config"
	"backend/entities"
	"database/sql"
	"fmt"

	"golang.org/x/crypto/bcrypt"
)

type postgresUserRepository struct {
    db *sql.DB
}

func NewPostgresUserRepository(db *sql.DB) UserRepository {
    return &postgresUserRepository{db: db}
}

func (r *postgresUserRepository) RegisterUser(user *entities.User) error {
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(user.Password), bcrypt.DefaultCost)
	if err != nil {
					return fmt.Errorf("error hashing password: %w", err)
	}

	user.Password = string(hashedPassword)

	query := `INSERT INTO users (uuid, first_name, last_name, username, email, password, phone_number, role_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8)`
	_, err = r.db.Exec(query, user.UUID, user.FirstName, user.LastName, user.Username, user.Email, user.Password, user.PhoneNumber, user.RoleID)
	if err != nil {
					return fmt.Errorf("error registering user: %w", err)
	}
	return nil
}

func SqlConnectString(cfg *config.Config) string {
	return fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
					cfg.DBHost, cfg.DBPort, cfg.DBUser, cfg.DBPassword, cfg.DBName)
}
