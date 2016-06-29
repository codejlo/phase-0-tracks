
function addBackgroundColor(event) {
	event.target.style.backgroundColor = "gray";
}

var item = document.getElementById("first-menu");
item.nextElementSibling.addEventListener("click", addBackgroundColor)

// addBackgroundColor();


