# 🧾 Register User API

This API allows new users to register and receive a token for authentication.

---

## 📌 Endpoint

**POST** `/api/users/register/`

---

## 📥 Request

The request must be a JSON object containing the following fields:

- `firstname`: (string) First name of the user  
- `lastname`: (string) Last name of the user  
- `email`: (string) A valid, unique email address  
- `password`: (string) A strong password (must include uppercase, lowercase, number, and special character)

### Example:

```json
{
  "firstname": "Cort",
  "lastname": "Doe",
  "email": "cortdoe123@example.com",
  "password": "Teut@12345"
}
```

## 📤 Response

The response will be a JSON object containing the following fields if the user is registered successfully:

- `message`: (string) Success message confirming registration  
- `user`: (object) Details of the newly registered user
  - `id`: (string) Unique ID assigned to the user
  - `fullname`: (object) Contains:
    - `firstname`: (string) First name
    - `lastname`: (string) Last name
  - `email`: (string) The registered email address
- `token`: (string) JWT token to be used for authentication in protected routes

### Example:

```json
{
  "message": "User registered successfully",
  "user": {
    "id": "68550d0fd2133261300ba34e",
    "fullname": {
      "firstname": "Cort",
      "lastname": "Doe"
    },
    "email": "cortdoe123@example.com"
  },
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
