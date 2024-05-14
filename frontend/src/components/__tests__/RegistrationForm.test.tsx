// RegistrationPage.test.tsx
import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import RegistrationPage from "../RegistrationForm";
import "@testing-library/jest-dom";

describe("RegistrationPage", () => {
  test("renders the registration form", () => {
    render(<RegistrationPage />);
    expect(screen.getByText("Register")).toBeInTheDocument();
    expect(screen.getByLabelText("First Name")).toBeInTheDocument();
    expect(screen.getByLabelText("Last Name")).toBeInTheDocument();
    expect(screen.getByLabelText("Username")).toBeInTheDocument();
    expect(screen.getByLabelText("Email")).toBeInTheDocument();
    expect(screen.getByLabelText("Password")).toBeInTheDocument();
    expect(screen.getByLabelText("Phone Number")).toBeInTheDocument();
    expect(
      screen.getByRole("button", { name: /Register/i })
    ).toBeInTheDocument();
  });

  test("submits the registration form", async () => {
    render(<RegistrationPage />);

    userEvent.type(screen.getByLabelText("First Name"), "John");
    userEvent.type(screen.getByLabelText("Last Name"), "Doe");
    userEvent.type(screen.getByLabelText("Username"), "johndoe");
    userEvent.type(screen.getByLabelText("Email"), "john@example.com");
    userEvent.type(screen.getByLabelText("Password"), "password");
    userEvent.type(screen.getByLabelText("Phone Number"), "1234567890");

    userEvent.click(screen.getByRole("button", { name: /Register/i }));
  });
});
