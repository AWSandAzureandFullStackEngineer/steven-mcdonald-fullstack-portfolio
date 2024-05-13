package dto

import (
	"backend/entities"

	"github.com/google/uuid"
)

type UserDTO struct {
	FirstName   string `json:"first_name"`
	LastName    string `json:"last_name"`
	Username    string `json:"username"`
	Email       string `json:"email"`
	Password    string `json:"password"`
	PhoneNumber string `json:"phone_number"`
}

func UserDtoToEntity(dto UserDTO) entities.User {
	return entities.User{
		UUID:        uuid.NewString(),
		FirstName:   dto.FirstName,
		LastName:    dto.LastName,
		Username:    dto.Username,
		Email:       dto.Email,
		Password:    dto.Password,
		PhoneNumber: dto.PhoneNumber,
		RoleID:      1, 
	}
}

func EntityToUserDto(user entities.User) UserDTO {
	return UserDTO{
		FirstName:   user.FirstName,
		LastName:    user.LastName,
		Username:    user.Username,
		Email:       user.Email,
		Password:    user.Password,
		PhoneNumber: user.PhoneNumber,
	}
}
