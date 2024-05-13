package service

import "backend/entities"

type UserService interface {
    RegisterUser(user *entities.User) error
}
