const fps = 24
const button_wait_time = 2000


var blob = new Blob([
   document.querySelector('#worker1').textContent
 ], { type: "text/javascript" })

var worker = new Worker(window.URL.createObjectURL(blob));

worker.onmessage = function(e) {
  update_video()
  setTimeout( () =>{
    worker.postMessage("");
  }, 1000/fps);
}
worker.postMessage("");

const press_button = document.getElementById('press')

press_button.addEventListener('click', invokePress, false)

function update_video() {
  document.getElementById('mjpeg_dest').src = "http://192.168.0.205:4001/html/cam_pic.php?time=" + new Date().getTime() + "&pDelay=4000"
}

function invokePress() {
  press_button.disabled = true
  var xhr = new XMLHttpRequest();
  xhr.open('GET', '/api/press');
  xhr.onload = function() {
    if (xhr.status === 200) {
    }
    else {
      console.log('Request failed.  Returned status of ' + xhr.status);
    }
  };
  xhr.send();

  setTimeout( () => {
    press_button.disabled = false
  }, button_wait_time)


}

console.log(screen.height)

document.getElementById('mjpeg_dest').style.width = screen.width*2;
document.getElementById('mjpeg_dest').style.height = screen.height;
