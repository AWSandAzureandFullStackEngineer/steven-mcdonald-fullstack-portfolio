import axios from 'axios';

const BASE_URL = 'http://localhost:8081';

export const registerUser = async (userData: any) => {
 try {
   const response = await axios.post(`${BASE_URL}/register`, userData);
   return response.data;
 } catch (error: any) {
   throw new Error(error.response?.data?.message || 'An error occurred');
 }
};
