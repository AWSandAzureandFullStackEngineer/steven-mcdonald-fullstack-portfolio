import { render, screen, waitFor } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import RegistrationForm from '../RegistrationForm';
import '@testing-library/jest-dom';


test('registers a user', async () => {
  render(<RegistrationForm />);

  userEvent.type(screen.getByLabelText('First Name'), 'John');
  userEvent.type(screen.getByLabelText('Last Name'), 'Doe');
  userEvent.type(screen.getByLabelText('Username'), 'johndoe');
  userEvent.type(screen.getByLabelText('Email'), 'john@example.com');
  userEvent.type(screen.getByLabelText('Password'), 'password');
  userEvent.type(screen.getByLabelText('Phone Number'), '1234567890');

  userEvent.click(screen.getByRole('button', { name: /Register/i }));

  await waitFor(() => {
    expect(screen.getByText('Registration successful')).toBeInTheDocument();
  });
});
