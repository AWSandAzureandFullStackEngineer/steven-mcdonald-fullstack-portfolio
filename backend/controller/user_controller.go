package controller

import (
    "backend/dto"
    "backend/service"
    "encoding/json"
    "net/http"
)

type UserController struct {
    UserService service.UserService
}

func NewUserController(userService service.UserService) *UserController {
    return &UserController{
        UserService: userService,
    }
}

func (c *UserController) RegisterUser(w http.ResponseWriter, r *http.Request) {
    var userDto dto.UserDTO
    if err := json.NewDecoder(r.Body).Decode(&userDto); err != nil {
        http.Error(w, "Invalid request body", http.StatusBadRequest)
        return
    }

    user := dto.UserDtoToEntity(userDto)
    if err := c.UserService.RegisterUser(&user); err != nil {
        http.Error(w, "Failed to register user", http.StatusInternalServerError)
        return
    }

    w.WriteHeader(http.StatusCreated)
}
