// REQUIRES JQUERY

// when the page is ready
$(function() {
    // when the submit button is clicked
    $('#submit-button').on('click', function(e) {
      // clear out all the error messages
       $('.error-field').removeClass('error-field');
       
       // grab the values of the text boxes
       var username = $('#username').val();
       var email = $('#email').val();
       var password = $('#password').val();
       
       // starts off valid
       var valid = true;
       
       // if username is blank, it's invalid and adds errors to the username label/field
       if(username === "" || username === null) {
           valid = false;
           $('#label-username').addClass('error-field');
           $('#username').addClass('error-field');
       } 
       
       // if email is blank, it's invalid and adds errors to the email label/field
       if(email === "" || email === null) {
           valid = false;
           $('#label-email').addClass('error-field');
           $('#email').addClass('error-field');
       }
       
       // if password is blank, it's invalid and adds errors to the password label/field
       if(password === "" || password === null) {
           valid = false;
           $('#label-password').addClass('error-field');
           $('#password').addClass('error-field');
       }
       
       // if returns true, will actually POST to the server. if false, won't POST
       return valid;
    });
    
    // when the clear button is clicked
    $('#clear-button').on('click', function(e) {
        // prevent any default behavior (possibly submitting the form)
        e.preventDefault();
        // set the value of all input boxes to an empty string
        $('form#signin-form').find('input[type=text],input[type=email],input[type=password]').val('');
        // clear out all the error messages
        $('.error-field').removeClass('error-field');
    });
    $('#photo_url').on('blur', function(ev) {
      var photo_url = $(this)




      )}






});