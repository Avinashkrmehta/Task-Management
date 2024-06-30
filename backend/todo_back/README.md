# README
Sample cURL Commands for Testing

Register a new user:
    curl -X POST -H "Content-Type: application/json" -d '{"name":"test","email":"test@example.com", "password":"password", "password_confirmation":"password", "name":"Test"}' http://localhost:3000/api/v1/register


Login and get a token:
    curl -X POST -H "Content-Type: application/json" -d '{"email":"test@example.com", "password":"password"}' http://localhost:3000/api/v1/login

List a tasks:
    TOKEN="eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE3MTk3ODk0MTJ9.9GmesB__wCuV3XB6U9fF8zGUSHGS78FvUbufFOdPgbg"
curl -X GET -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" http://localhost:3000/api/v1/tasks


Create a task:
    TOKEN="eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE3MTk3ODk0MTJ9.9GmesB__wCuV3XB6U9fF8zGUSHGS78FvUbufFOdPgbg"
curl -X POST -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" -d '{"title":"Task Title", "description":"Task Description", "status":"To Do"}' http://localhost:3000/api/v1/tasks

Update a task:
    TOKEN="eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE3MTk3ODk0MTJ9.9GmesB__wCuV3XB6U9fF8zGUSHGS78FvUbufFOdPgbg"
curl -X PATCH -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" -d '{"title":"Task Title", "description":"Task Description", "status":"Done"}' http://localhost:3000/api/v1/tasks

TOKEN="eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE3MTk3ODk0MTJ9.9GmesB__wCuV3XB6U9fF8zGUSHGS78FvUbufFOdPgbg"
TASK_ID="1"
curl -X PUT -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" -d '{"title":"Updated Task Title", "description":"Updated Task Description", "status":"in_progress"}' http://localhost:3000/api/v1/tasks/$TASK_ID

Delete a task
TOKEN="eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE3MTk3ODk0MTJ9.9GmesB__wCuV3XB6U9fF8zGUSHGS78FvUbufFOdPgbg"
TASK_ID=1 
curl -X DELETE -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" http://localhost:3000/api/v1/tasks/$TASK_ID
