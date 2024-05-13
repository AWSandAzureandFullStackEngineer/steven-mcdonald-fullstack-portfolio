import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import RegistrationPage from './pages/RegistrationPage';

const App: React.FC = () => {
  return (
    <Router>
      <Routes>
        <Route path='register' element={<RegistrationPage />} />
      </Routes>
    </Router>
  );
};

export default App;
