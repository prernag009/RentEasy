var modal = document.getElementById("myModal");
var signupbtn = document.getElementById("signup");
var ownerBtn = document.getElementById("ownerBtn");
var tenantBtn = document.getElementById("tenantBtn");
var loginbtn = document.getElementById("login");

if(signupbtn!==null){
	signupbtn.onclick = function() {
  modal.style.display = "block";
  }
ownerBtn.onclick = function() {
  window.location.href = "Registration";
}

tenantBtn.onclick = function() {
  window.location.href = "tenantRegistration";
}

loginbtn.onclick = function() {
  window.location.href = "login";
}
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

