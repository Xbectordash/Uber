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

---

# 🛡️ Captain Login API

This API allows registered captains to log in and receive an authentication token.

---

## 📌 Endpoint

**POST** `/api/captains/login/`

---

## 📥 Request

The request must be a JSON object containing the following fields:

- `email`: (string) The registered email address
- `password`: (string) The captain's password

### Example:

```json
{
  "email": "john.smith@example.com",
  "password": "StrongPass@123"
}
```

## 📤 Response

The response will be a JSON object containing the following fields upon successful login:

- `message`: (string) Success message confirming login
- `captain`: (object) Details of the logged-in captain
  - `id`: (string) Unique ID of the captain
  - `fullname`: (object)
    - `firstname`: (string) First name
    - `lastname`: (string) Last name
  - `email`: (string) The captain's email address
  - `vehicle`: (object)
    - `color`: (string) Color of the vehicle
    - `plate`: (string) Vehicle plate number
    - `capacity`: (number) Vehicle capacity
    - `vehicleType`: (string) Type of vehicle
- `token`: (string) JWT token to be used for authentication in protected routes

### Example:

```json
{
  "message": "Captain logged in successfully",
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

---

# 👤 Get Captain Profile API

This API returns the profile information of the authenticated captain.

---

## 📌 Endpoint

**GET** `/api/captains/profile/`

---

## 🔒 Authentication

Requires a valid JWT token in the `Authorization` header as a Bearer token or in the `token` cookie.

---

## 📤 Response

Returns the captain object for the authenticated captain.

### Example:

```json
{
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
}
```

---

# 🚪 Captain Logout API

This API logs out the authenticated captain by blacklisting the current token.

---

## 📌 Endpoint

**GET** `/api/captains/logout/`

---

## 🔒 Authentication

Requires a valid JWT token in the `Authorization` header as a Bearer token or in the `token` cookie.

---

## 📤 Response

Returns a message confirming successful logout.

### Example:

```json
{
  "message": "Captain logged out successfully"
}
```

---

# 🗺️ Map API Endpoints

These endpoints provide geocoding, distance/time calculation, and address suggestions using Google Maps services. All endpoints require user authentication.

---

## 📌 Get Coordinates

**GET** `/api/maps/get-coordinates`

### Query Parameters

- `address`: (string, required) The address to geocode

### Authentication

Requires a valid JWT token in the `Authorization` header as a Bearer token or in the `token` cookie.

### Example Request

```
GET /api/maps/get-coordinates?address=New+York
```

### Example Response

```json
{
  "message": "Coordinates fetched successfully",
  "coordinates": {
    "lat": 40.7127753,
    "lng": -74.0059728
  }
}
```

---

## 📌 Get Distance and Time

**GET** `/api/maps/get-distance-time`

### Query Parameters

- `origin`: (string, required) The starting address or location
- `destination`: (string, required) The destination address or location

### Authentication

Requires a valid JWT token in the `Authorization` header as a Bearer token or in the `token` cookie.

### Example Request

```
GET /api/maps/get-distance-time?origin=New+York&destination=Boston
```

### Example Response

```json
{
  "message": "Distance and time fetched successfully",
  "distanceTime": {
    "distance": "346 km",
    "duration": "3 hours 45 mins"
  }
}
```

---

## 📌 Get Suggestions

**GET** `/api/maps/get-suggestions`

### Query Parameters

- `input`: (string, required) The partial address or place name to get suggestions for

### Authentication

Requires a valid JWT token in the `Authorization` header as a Bearer token or in the `token` cookie.

### Example Request

```
GET /api/maps/get-suggestions?input=New
```

### Example Response

```json
{
  "message": "Suggestions fetched successfully",
  "suggestions": [
    "New York, NY, USA",
    "Newark, NJ, USA",
    "New Orleans, LA, USA"
  ]
}
```

---

# 🚕 Ride API Endpoints

These endpoints allow users to create rides, get fare estimates, and confirm rides.

---

## 📌 Create Ride

**POST** `/api/rides/create-ride`

### Request Body

- `pickupLocation`: (string, required) The pickup address/location
- `dropoffLocation`: (string, required) The dropoff address/location
- `vehicleType`: (string, required) Type of vehicle (`car`, `moto`, or `auto`)

### Authentication

Requires a valid JWT token in the `Authorization` header as a Bearer token or in the `token` cookie.

### Example Request

```json
{
  "pickupLocation": "Vashi Railway Station, Navi Mumbai, Maharashtra",
  "dropoffLocation": "Chhatrapati Shivaji Maharaj Terminus, Mumbai, Maharashtra",
  "vehicleType": "car"
}
```

### Example Response

```json
{
  "message": "Ride created successfully",
  "ride": {
    "_id": "660a1b2c3d4e5f6g7h8i9j0",
    "pickup": "Vashi Railway Station, Navi Mumbai, Maharashtra",
    "destination": "Chhatrapati Shivaji Maharaj Terminus, Mumbai, Maharashtra",
    "vehicleType": "car",
    "status": "pending",
    "fare": 350,
    "otp": "123456",
    "createdAt": "2025-06-23T12:34:56.789Z"
  }
}
```

---

## 📌 Get Fare Estimate

**GET** `/api/rides/get-fare`

### Query Parameters

- `pickup`: (string, required) The pickup address/location
- `destination`: (string, required) The destination address/location

### Authentication

Requires a valid JWT token in the `Authorization` header as a Bearer token or in the `token` cookie.

### Example Request

```
GET /api/rides/get-fare?pickup=Vashi+Railway+Station,+Navi+Mumbai,+Maharashtra&destination=Chhatrapati+Shivaji+Maharaj+Terminus,+Mumbai,+Maharashtra
```

### Example Response

```json
{
  "message": "Fare fetched successfully",
  "fare": {
    "auto": 300,
    "car": 350,
    "moto": 250
  }
}
```

---

## 📌 Confirm Ride

**POST** `/api/rides/confirm`

### Request Body

- `rideId`: (string, required) The ride's MongoDB ObjectId
- `otp`: (string, required) The OTP sent to the user for ride confirmation

### Authentication

Requires a valid JWT token in the `Authorization` header as a Bearer token or in the `token` cookie (captain only).

### Example Request

```json
{
  "rideId": "660a1b2c3d4e5f6g7h8i9j0",
  "otp": "123456"
}
```

### Example Response

```json
{
  "message": "Ride confirmed successfully",
  "ride": {
    "_id": "660a1b2c3d4e5f6g7h8i9j0",
    "status": "confirmed"
  }
}
```

---

# 🔌 Socket.IO Integration

This backend uses Socket.IO for real-time communication.

## Initialization

Socket.IO is initialized in `server.js` using the exported `initializeSocket(server)` function from `socket.js`.

## Sending Messages

To send a message to a specific socket:

```js
const { sendMessageToSocket } = require("./socket");
sendMessageToSocket(socketId, "eventName", { your: "data" });
```

- `socketId`: The unique ID of the connected socket
- `eventName`: The event name to emit
- The third argument is the message payload (object)

## Example Usage

When a user connects, you can store their socket ID and use `sendMessageToSocket` to send them updates (e.g., ride status changes, notifications, etc.).

---
