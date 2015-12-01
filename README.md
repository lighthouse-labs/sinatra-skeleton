Contact List version 4
========================

## Getting Started

1. `bundle install`
2. `shotgun -p 3000 -o 0.0.0.0`
3. Visit `http://localhost:3000/` in your browser

## Assignment

Contact List App (v4) - The API edition
Build another version of your contact list app, but this time it's going to have the following characteristics:

It will be a web app
You will use Sinatra (Use the skeleton code here ) for the server
It will be built with a JSON API
It will use jQuery and JS to talk to the server via AJAX
Your app will therefore be an SPA (a Single Page App - read this if you're unclear on what we mean!)
Note: If you're bored by Contact List App and would rather build a different app (eg: Instagram clone), then you're encouraged to get creative. Just run your idea by an instructor and keep the model layer simple (one or two models/tables only).

API?
The server side of your web app is going to be a "thin" backend API service (layer) that will return JSON to AJAX HTTP requests. Contacts, Search results, posting new contacts, etc. will all still be separate actions, but these server-side actions will respond with objects (seralized as JSON instead of XML, since JSON is cooler). Your JS/jQuery will use the API and manage the UI / UX (flow) of your web app.

The single page app is effectively just a client of your server API. With this separation of concern, theoretically you could allow other clients to consume/use that same API.

For purposes of keeping things simple, for this exercise we're not going to worry about authentication / security. As such, don't worry about OAuth, sessions, login / logout, registration, etc.

Your API should NOT be serving up ANYTHING BUT JSON. No HTML, CSS, or JavaScript. That said, we do need to load the initial HTML (DOM) for the web app. Your index route (get '/' do ... end) will therefore be the first page that users (browsers) will visit and it will send down your static page (HTML, CSS, JS). All other routes in Sinatra should just serve JSON and will make up your app's JSON API.

Endpoints
Your routing in your Sinatra app will be just as important as before, perhaps more so, as it is the 'front-end' of your API. Logical routes should be constructed for the purposes of sending and receiving data with the API.

All of the functionality that you had before (Adding new contacts, searching contacts, listing contacts, viewing a contact, deleting contacts) should be available through the web interface. Each one should have a separate endpoint (route) to accomplish the task.

Something you may have noticed in some APIs (GitHub, Instagram) is that they will namespace their routes/endpoints by having /api/v1/<action> or /api/v2/<action> as a way to designate different functionality on the same endpoint. Your app probably shouldn't grow to this point, but it is valuable to know that this is a common technique used when building service APIs.

CSS!
Take some time to present your contacts and your forms in a visually-pleasing manner. (But not too much!) Frameworks like Bootstrap and Foundation can help you with this.

jQuery
The jQuery AJAX methods are going to be very important to you.

$.get()
$.post()
$.getJSON()
$.ajax()
Remember that if you are using $.get(), $.post(), or $.ajax() you have to specify the data type as JSON, for jQuery to understand the JSON object that it receives from the server.

## Stretch Goals (optional)
Stretch 1
Looking at your finished code, you'll probably find that you have HTML code within your JS code (as strings). Your view logic is effectively coupled into your client-side business logic code. This is bad separation of concern.

To de-couple the view from the other stuffs, you could use a template library to pre-define the HTML as templates. These are much like templates / partials in ERB on the server-side, except these are client-side, in the DOM.

There are MANY different JS template libraries, each with their own strengths and opinions. Some of them are listed here. Suggest you use either MustacheJS or Handlerbars for this exercise. Another option is JsRender

Stretch 2
Integrate a third-party API like Instagram or Twitter to supplement the contact details for your contacts. Perhaps add a 'Twitter handle' field as a contact field, and if supplied, it fetches the user's twitter avatar. You would need to set up an app on the third-party service (Ex. Twitter Apps ) and get an API token to be able to communicate with the third-party API. But it will also give you some exposure to their API endpoint naming and documentation, which can help you craft yours.