package repository_test

import (
    "backend/entities"
    "backend/repository"
    "testing"

    "github.com/DATA-DOG/go-sqlmock"
    "github.com/stretchr/testify/assert"
)

func TestRegisterUser(t *testing.T) {
    db, mock, err := sqlmock.New()
    if err != nil {
        t.Fatalf("an error '%s' was not expected when opening a stub database connection", err)
    }
    defer db.Close()

    repo := repository.NewPostgresUserRepository(db)

    mock.ExpectExec("INSERT INTO users").
        WithArgs(
            sqlmock.AnyArg(), sqlmock.AnyArg(), sqlmock.AnyArg(), sqlmock.AnyArg(),
            sqlmock.AnyArg(), sqlmock.AnyArg(), sqlmock.AnyArg(), sqlmock.AnyArg(),
        ).
        WillReturnResult(sqlmock.NewResult(1, 1))

    user := &entities.User{
        UUID:        "test-uuid",
        FirstName:   "John",
        LastName:    "Doe",
        Username:    "johndoe",
        Email:       "john@example.com",
        Password:    "password",
        PhoneNumber: "1234567890",
        RoleID:      1,
    }

    err = repo.RegisterUser(user)
    assert.NoError(t, err)
    if err := mock.ExpectationsWereMet(); err != nil {
        t.Errorf("there were unmet expectations: %s", err)
    }
}
