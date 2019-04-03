Useful Tips
=============
=>  The public folder will be used to keep any public facing assets, such as images and stylesheets.
=>
 The views folder will keep all of our Slim templates

=> You may have noticed that the route contains the string ‘:task’ – this is a named parameter, identifiable by the leading colon(‘:’).
   ~Named parameters are values taken from the url that are accessible through the ‘params’ hash.
   ~I set an instance variable called ‘@task’ equal to the value of params[:task], which will be whatever is written after the forward slash in the url. Instance variables are useful as they can be referenced in views.  