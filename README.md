This is the simple Rails application for REST api.


1) Receive a url.
Parse the page content of the url, extract the contents of <h1>, <h2>, <h3>, <a> tag and store them to database.

example curl for test.

curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"resource":{"url":"https://www.yahoo.com"}}'  http://localhost:3000/resources


2) Get url list stored in DB.

example curl

curl -X GET http://localhost:3000/resources


3) Get contents of url

example curl

curl -X GET http://localhost:3000/resources/4