package service

import (
    "backend/entities"
    "backend/repository"
)

type userServiceImpl struct {
    userRepo repository.UserRepository
}

func NewUserServiceImpl(userRepo repository.UserRepository) UserService {
    return &userServiceImpl{userRepo: userRepo}
}

func (s *userServiceImpl) RegisterUser(user *entities.User) error {
    return s.userRepo.RegisterUser(user)
}
