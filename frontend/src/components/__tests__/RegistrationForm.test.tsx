// RegistrationForm.test.tsx
import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import '@testing-library/jest-dom';
import RegistrationForm from '../RegistrationForm';

test('registers a user', async () => {
  render(<RegistrationForm />);

  fireEvent.change(screen.getByLabelText('First Name'), { target: { value: 'John' } });
  fireEvent.change(screen.getByLabelText('Last Name'), { target: { value: 'Doe' } });
  fireEvent.change(screen.getByLabelText('Username'), { target: { value: 'johndoe' } });
  fireEvent.change(screen.getByLabelText('Email'), { target: { value: 'john@example.com' } });
  fireEvent.change(screen.getByLabelText('Password'), { target: { value: 'password' } });
  fireEvent.change(screen.getByLabelText('Phone Number'), { target: { value: '1234567890' } });

  fireEvent.click(screen.getByRole('button', { name: 'Register' }));

  await waitFor(() => {
    expect(screen.getByText('Registration successful')).toBeInTheDocument();
  });
});

