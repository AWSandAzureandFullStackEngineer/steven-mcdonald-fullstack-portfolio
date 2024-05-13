package repository

import "backend/entities"

type UserRepository interface {
    RegisterUser(user *entities.User) error
}
