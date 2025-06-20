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
```

---

# 🔐 Login User API

This API allows existing users to login and receive an authentication token.

---

## 📌 Endpoint

**POST** `/api/users/login/`

---

## 📥 Request

The request must be a JSON object containing the following fields:

- `email`: (string) The registered email address
- `password`: (string) The user's password

### Example:

```json
{
  "email": "cortdoe123@example.com",
  "password": "Teut@12345"
}
```

## 📤 Response

The response will be a JSON object containing the following fields upon successful login:

- `message`: (string) Success message confirming login
- `user`: (object) Details of the logged-in user
  - `id`: (string) Unique ID of the user
  - `fullname`: (string) Full name of the user
  - `email`: (string) The user's email address
- `token`: (string) JWT token to be used for authentication in protected routes

### Example:

```json
{
  "message": "User logged in successfully",
  "user": {
    "id": "64a1b2c3d4e5f6g7h8i9j0",
    "fullname": "Cort Doe",
    "email": "cortdoe123@example.com"
  },
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

---

# 👤 Get User Profile API

This API returns the profile information of the authenticated user.

---

## 📌 Endpoint

**GET** `/api/users/profile/`

---

## 🔒 Authentication

Requires a valid JWT token in the `Authorization` header as a Bearer token or in the `token` cookie.

---

## 📤 Response

Returns the user object for the authenticated user.

### Example:

```json
{
  "id": "64a1b2c3d4e5f6g7h8i9j0",
  "fullname": "Cort Doe",
  "email": "cortdoe123@example.com"
}
```

---

# 🚪 Logout User API

This API logs out the authenticated user by blacklisting the current token.

---

## 📌 Endpoint

**GET** `/api/users/logout/`

---

## 🔒 Authentication

Requires a valid JWT token in the `Authorization` header as a Bearer token or in the `token` cookie.

---

## 📤 Response

Returns a message confirming successful logout.

### Example:

```json
{
  "message": "User logged out successfully"
}
```

---

# 🚗 Register Captain API

This API allows new captains (drivers) to register and receive a token for authentication.

---

## 📌 Endpoint

**POST** `/api/captains/register/`

---

## 📥 Request

The request must be a JSON object containing the following fields:

- `fullname`: (object)
  - `firstname`: (string) First name of the captain
  - `lastname`: (string) Last name of the captain
- `email`: (string) A valid, unique email address
- `password`: (string) A strong password
- `vehicle`: (object)
  - `color`: (string) Color of the vehicle
  - `plate`: (string) Unique vehicle plate number
  - `capacity`: (number) Capacity of the vehicle
  - `vehicleType`: (string) Type of vehicle (`car`, `motorcycle`, or `auto`)

### Example:

```json
{
  "fullname": {
    "firstname": "John",
    "lastname": "Smith"
  },
  "email": "john.smith@example.com",
  "password": "StrongPass@123",
  "vehicle": {
    "color": "Red",
    "plate": "AB123CD",
    "capacity": 4,
    "vehicleType": "car"
  }
}
```

## 📤 Response

The response will be a JSON object containing the following fields if the captain is registered successfully:

- `message`: (string) Success message confirming registration
- `captain`: (object) Details of the newly registered captain
  - `id`: (string) Unique ID assigned to the captain
  - `fullname`: (object)
    - `firstname`: (string) First name
    - `lastname`: (string) Last name
  - `email`: (string) The registered email address
  - `vehicle`: (object)
    - `color`: (string) Color of the vehicle
    - `plate`: (string) Vehicle plate number
    - `capacity`: (number) Vehicle capacity
    - `vehicleType`: (string) Type of vehicle
- `token`: (string) JWT token to be used for authentication in protected routes

### Example:

```json
{
  "message": "Captain registered successfully",
  "captain": {
    "id": "65a1b2c3d4e5f6g7h8i9j0",
    "fullname": {
      "firstname": "John",
      "lastname": "Smith"
    },
    "email": "john.smith@example.com",
    "vehicle": {
      "color": "Red",
      "plate": "AB123CD",
      "capacity": 4,
      "vehicleType": "car"
    }
  },
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```
