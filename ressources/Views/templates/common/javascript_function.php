<script>

function text2pixel(str, margin = 5 /* margin is like offset */){
    var canvas = document.createElement('canvas');
    var ctx = canvas.getContext("2d");
    //https://www.w3schools.com/tags/canvas_font.asp - For more customization of message-box
    ctx.font = "message-box";        
    var width = ctx.measureText(str).width;
    return width + margin;
}


function flash_msg(msg, timeout = 5 /* en seconde */ ){
    $.blockUI({
        message: msg,
        fadeIn: 700,
        fadeOut: 700,
        timeout: timeout*1000,
        showOverlay: false,
        centerY: false,
        css: {
            width:  text2pixel(msg)+'px',
            top: '20px',
            left: '',
            right: '20px',
            border: 'none',
            padding: '15px 5px',
            backgroundColor: '#333',
            '-webkit-border-radius': '10px',
            '-moz-border-radius': '10px',
            opacity: 0.9,
            color: '#fff'
        }
    });
}

function notify(msg, timeout = 5 /* en seconde */ ){
    flash_msg(msg, timeout)
}

function alert(title, msg, type ){
    swal(title, msg, type);
}

function block_notification(msg, timeout = 5000){
    $.blockUI({
        message: msg,
        fadeIn: 700,
        fadeOut: 700,
        timeout: timeout,
        showOverlay: false,
        centerY: false,
        css: {
            width:  text2pixel(msg)+'px',
            top: '20px',
            left: '',
            right: '20px',
            border: 'none',
            padding: '15px 5px',
            backgroundColor: '#333',
            '-webkit-border-radius': '10px',
            '-moz-border-radius': '10px',
            opacity: 0.9,
            color: '#fff'
        }
    });
}


  /**
   * {LINK}
   * https://stackoverflow.com/questions/2367594/open-url-while-passing-post-data-with-jquery
   * https://stackoverflow.com/questions/2367979/pass-post-data-with-window-location-href?rq=1
   * https://stackoverflow.com/questions/133925/javascript-post-request-like-a-form-submit/133997#133997
   * https://webmasters.stackexchange.com/questions/7958/can-i-post-to-a-new-window-that-i-want-to-open-up
   * 
   * {USAGE}
   * gotoUrl("actionPage.php", {'cmd':'nextPage', 'data':sampleData});
   * 
 * Function that will redirect to a new page & pass data using submit
 * @param {type} path -> new url
 * @param {type} params -> JSON data to be posted
 * @param {type} method -> GET or POST
 * @returns {undefined} -> NA
 */
function gotoUrl(path, params, method = "POST", newWindow = true) {
    //Null check
    method = method || "post"; // Set method to post by default if not specified.

    // The rest of this code assumes you are not using a library.
    // It can be made less wordy if you use one.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);

   
    if(newWindow)
        form.setAttribute('target', '_blank'); 


    //Fill the hidden form
    if (typeof params === 'string') {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", 'data');
        hiddenField.setAttribute("value", params);
        form.appendChild(hiddenField);
    }
    else {
        for (var key in params) {
            if (params.hasOwnProperty(key)) {
                var hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", key);
                if(typeof params[key] === 'object'){
                    hiddenField.setAttribute("value", JSON.stringify(params[key]));
                }
                else{
                    hiddenField.setAttribute("value", params[key]);
                }
                form.appendChild(hiddenField);
            }
        }
    }

    document.body.appendChild(form);
    form.submit();
}

</script>
