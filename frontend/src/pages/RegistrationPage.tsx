import React from "react";
import RegistrationForm from "../components/RegistrationForm";

const RegistrationPage: React.FC = () => {
  return (
    <div className="text-center">
      <h1 className="text-3xl font-bold mb-6">Register</h1>
      <RegistrationForm />
    </div>
  );
};

export default RegistrationPage;
